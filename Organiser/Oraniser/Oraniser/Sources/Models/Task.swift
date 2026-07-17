//
//  Task.swift
//  Oraniser
//
//  Created by Yelyzaveta Kuzmina on 16.07.2026.
//

import Foundation

struct Task {
    
    var id: UUID
    var title: String
    var shortDescription: String?
    var phoneNumber: String?
    
    var dueDate: Date?
    
    var isUrgency: Bool?
    var isCompleted: Bool
    
    var repeatRule: RepeatRule?
    var subTasks: [SubTask]
    var media: [Media]
    var location: Location?
    
}

enum RepeatRule {
    
}
