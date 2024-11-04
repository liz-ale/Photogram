//
//  PhotoListView.swift
//  Photogram
//
//  Created by lizbeth.alejandro on 01/11/24.
//

import SwiftUI

struct PhotosListView: View {
    @StateObject private var viewModel = PhotosListViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.photos, id: \.id) { photo in
                NavigationLink(destination: PhotoDetailView(photo: photo)) {
                    HStack {
                        Text(photo.title)
                            .font(.body)
                            .foregroundColor(.primary)
                            .lineLimit(1)
                        Spacer()
                        if let thumbnail = viewModel.imageCache[photo.thumbnailUrl] {
                            Image(uiImage: thumbnail)
                                .resizable()
                                .frame(width: 50, height: 50)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        } else {
                            ProgressView()
                                .frame(width: 50, height: 50)
                                .task {
                                    await viewModel.loadImage(for: photo.thumbnailUrl)
                                }
                        }
                    }
                }
            }
            .navigationTitle("Photos")
            .task {
                await viewModel.fetchPhotos()
            }
        }
    }
}

