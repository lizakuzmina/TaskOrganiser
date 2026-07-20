//
//  Location.swift
//  Oraniser
//
//  Created by Yelyzaveta Kuzmina on 16.07.2026.
//

import Foundation
import SwiftData

@Model
final class Location {
    init(title: String, latitude: Double, longitude: Double) {
        self.title = title
        self.latitude = latitude
        self.longitude = longitude
    }
    
    var title: String
    var latitude: Double
    var longitude: Double
}
