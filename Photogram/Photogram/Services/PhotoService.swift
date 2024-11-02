//
//  PhotoService.swift
//  Photogram
//
//  Created by lizbeth.alejandro on 01/11/24.
//

import Foundation

enum NetworkError: Error {
    case BadURL
    case NoData
    case DecodingError
}

class PhotoService {
    func fetchPhotos(completion: @escaping (Result<[Photo], NetworkError>) -> Void) async {
        let url = URL(string: "https://jsonplaceholder.typicode.com/photos")!
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data else {
                completion(.failure(.NoData))
                return
            }
        }
    }
}
