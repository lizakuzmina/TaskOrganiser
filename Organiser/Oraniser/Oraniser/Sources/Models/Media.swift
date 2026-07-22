//
//  Media.swift
//  Oraniser
//
//  Created by Yelyzaveta Kuzmina on 16.07.2026.
//

import Foundation
import SwiftData

@Model
final class Media {
    init(id: UUID, url: URL, type: MediaType) {
        self.id = id
        self.url = url
        self.type = type
    }
    
    var id: UUID
    var url: URL
    var type: MediaType
}

enum MediaType: String, Codable {
    case image
    case video
    case document
}
