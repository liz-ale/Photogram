//
//  PhotosListViewModel.swift
//  Photogram
//
//  Created by lizbeth.alejandro on 01/11/24.
//

import Foundation
import SwiftUI

@MainActor
class PhotosListViewModel: ObservableObject {
    @Published var photos: [Photo] = []
    @Published var imageCache: [String: UIImage] = [:]
    
    private let service = PhotoService()
    
    func fetchPhotos() async {
        let result = await service.fetchPhotos()
        switch result {
        case .success(let photos):
            self.photos = photos
        case .failure(let error):
            print("Failed to fetch photos: \(error)")
        }
    }
    
    func loadImage(for url: String) async {
        if imageCache[url] != nil {
            return
        }
        
        if let image = await service.fetchImage(from: url) {
            imageCache[url] = image
        }
    }
}
