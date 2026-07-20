//
//  SubTask.swift
//  Oraniser
//
//  Created by Yelyzaveta Kuzmina on 16.07.2026.
//

import Foundation
import SwiftData

@Model
final class SubTask {
    init(text: String, isDone: Bool) {
        self.text = text
        self.isDone = isDone
    }
    
    var text: String
    var isDone: Bool
}
