//
//  Photo.swift
//  Photogram
//
//  Created by lizbeth.alejandro on 01/11/24.
//

import Foundation

struct Photo: Codable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}
