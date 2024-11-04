//
//  PhotoListViewModel.swift
//  Photogram
//
//  Created by lizbeth.alejandro on 03/11/24.
//

import Foundation
import SwiftUI

@MainActor
class PhotosListViewModel: ObservableObject {
    @Published var photos: [Photo] = []
    
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
}
