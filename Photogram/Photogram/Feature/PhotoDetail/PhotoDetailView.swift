//
//  PhotoDetailView.swift
//  Photogram
//
//  Created by lizbeth.alejandro on 01/11/24.
//

import Foundation
import SwiftUI

struct PhotoDetailView: View {
    let photo: Photo
    @State private var photoImage: UIImage?
    
    var body: some View {
        VStack {
            if let image = photoImage {
                //async image se puede ocupar??
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 600, height: 600)
            } else {
                ProgressView()
                    .frame(width: 600, height: 600)
            }
            Text(photo.title)
                .font(.title)
                .padding()
            Spacer()
        }
        .navigationTitle("Photo Detail")
        .task {
            let service = PhotoService()
            self.photoImage = await service.fetchImage(from: photo.url)
        }
    }
}
