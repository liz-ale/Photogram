//
//  PhotoDetailView.swift
//  Photogram
//
//  Created by lizbeth.alejandro on 03/11/24.
//

import Foundation
import SwiftUI

struct PhotoDetailView: View {
    let photo: Photo
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: photo.url)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .padding()
            } placeholder: {
                ProgressView()
                    .frame(maxWidth: .infinity)
                    .padding()
            }
            
            Text(photo.title)
                .font(.title)
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.leading)
                .padding()
            Spacer()
        }
    }
}

