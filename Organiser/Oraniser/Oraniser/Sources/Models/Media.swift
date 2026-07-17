//
//  Media.swift
//  Oraniser
//
//  Created by Yelyzaveta Kuzmina on 16.07.2026.
//

import Foundation

struct Media {
    var id: UUID
    var url: URL
    var type: MediaType
}

enum MediaType {
    case image
    case video
    case document
}
