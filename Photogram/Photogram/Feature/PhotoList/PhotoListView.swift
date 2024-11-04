//
//  PhotoListView.swift
//  Photogram
//
//  Created by lizbeth.alejandro on 03/11/24.
//

import Foundation
import SwiftUI

struct PhotosListView: View {
    @StateObject private var viewModel = PhotosListViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.photos, id: \.id) { photo in
                NavigationLink(destination: PhotoDetailView(photo: photo)) {
                    HStack {
                        Text("Photo \(photo.id)")
                            .font(.body)
                            .foregroundColor(.primary)
                            .lineLimit(1)
                        Spacer()
                        AsyncImage(url: URL(string: photo.thumbnailUrl)) { image in
                            image
                                .resizable()
                                .frame(width: 50, height: 50)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        } placeholder: {
                            ProgressView()
                                .frame(width: 50, height: 50)
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
