//
//  Task.swift
//  Oraniser
//
//  Created by Yelyzaveta Kuzmina on 16.07.2026.
//

import Foundation
import SwiftData

@Model
final class Task {
    init(id: UUID, title: String, shortDescription: String? = nil, phoneNumber: String? = nil, dueDate: Date? = nil, createdAt: Date = Date(), isUrgency: Bool = false, isCompleted: Bool, repeatRule: RepeatRule? = nil, subTasks: [SubTask], media: [Media], location: Location? = nil) {
        self.id = id
        self.title = title
        self.shortDescription = shortDescription
        self.phoneNumber = phoneNumber
        self.dueDate = dueDate
        self.createdAt = createdAt
        self.isUrgency = isUrgency
        self.isCompleted = isCompleted
        self.repeatRule = repeatRule
        self.subTasks = subTasks
        self.media = media
        self.location = location
    }
   
    
    
    var id: UUID
    var title: String
    var shortDescription: String?
    var phoneNumber: String?
    
    var dueDate: Date?
    var createdAt: Date = Date()
    
    var isUrgency: Bool = false
    var isCompleted: Bool
    
    var repeatRule: RepeatRule?
    var subTasks: [SubTask]
    var media: [Media]
    var location: Location?
    
}

enum RepeatRule: String, Codable {
    case daily
    case weekly
    case monthly
    case yearly
}
