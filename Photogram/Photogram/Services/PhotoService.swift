//
//  PhotoService.swift
//  Photogram
//
//  Created by lizbeth.alejandro on 01/11/24.
//

import Foundation
import UIKit

enum NetworkError: Error {
    case BadURL
    case NoData
    case DecodingError
}

class PhotoService {
    func fetchPhotos() async -> Result<[Photo], NetworkError> {
        let url = URL(string: "https://jsonplaceholder.typicode.com/photos")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            print(String(decoding: data, as: Unicode.UTF8.self))
            
            guard (response as! HTTPURLResponse).statusCode == 200 else {
                return .failure(.BadURL)
                
            }
            
            let photos = try JSONDecoder().decode([Photo].self, from: data)
            return .success(photos)
            
        } catch {
            print("error decoding" + error.localizedDescription)
            return .failure(.NoData)
        }
    }
    
    func fetchImage(from url: String) async -> UIImage? {
        guard let url = URL(string: url) else { return nil }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return UIImage(data: data)
        } catch {
            print("Failed to fetch image: \(error)")
            return nil
        }
    }
}
