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
    init(id: UUID, title: String, shortDescription: String? = nil, phoneNumber: String? = nil, dueDate: Date? = nil, createdAt: Date = Date(), reminder: ReminderOption?, isUrgency: Bool = false, isCompleted: Bool, repeatRule: RepeatRule? = nil, subTasks: [SubTask], media: [Media], location: Location? = nil) {
        self.id = id
        self.title = title
        self.shortDescription = shortDescription
        self.phoneNumber = phoneNumber
        self.dueDate = dueDate
        self.createdAt = createdAt
        self.reminder = reminder
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
    
    var reminder: ReminderOption?
    var isUrgency: Bool = false
    var isCompleted: Bool
    
    var repeatRule: RepeatRule?
    var subTasks: [SubTask]
    var media: [Media]
    var location: Location?
    
}

enum RepeatRule: String, Codable, CaseIterable {
    case hourly
    case daily
    case everyWeekday
    case everyWeekend
    case weekly
    case everyTwoWeeks
    case monthly
    case everyThreeMonths
    case everySixMonths
    case yearly

    var title: String {
        switch self {
        case .hourly:
            "Щогодини"
        case .daily:
            "Щодня"
        case .everyWeekday:
            "Щобудня"
        case .everyWeekend:
            "Щовихідних"
        case .weekly:
            "Щотижня"
        case .everyTwoWeeks:
            "Кожні 2 тижні"
        case .monthly:
            "Щомісяця"
        case .everyThreeMonths:
            "Кожні 3 місяці"
        case .everySixMonths:
            "Кожні 6 місяців"
        case .yearly:
            "Щороку"
        }
    }
}

enum ReminderOption: String, Codable, CaseIterable {
    case fiveMinutes
    case fifteenMinutes
    case thirtyMinutes
    case oneHour
    case oneDay

    var title: String {
        switch self {
        case .fiveMinutes:
            "5 хвилин"
        case .fifteenMinutes:
            "15 хвилин"
        case .thirtyMinutes:
            "30 хвилин"
        case .oneHour:
            "1 година"
        case .oneDay:
            "1 день"
        }
    }
}
