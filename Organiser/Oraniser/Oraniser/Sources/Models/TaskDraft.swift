//
//  TaskDraft.swift
//  Oraniser
//
//  Created by Yelyzaveta Kuzmina on 08.09.2026.
//

import Foundation

struct TaskDraft {
    var title: String
    var shortDescription: String = ""
    var phoneNumber: String?
    var dueDate: Date?
    var reminder: ReminderOption?
    var isUrgency: Bool = false
    var repeatRule: RepeatRule?
    var subTasks: [SubTask] = []
    var media: [Media] = []
    var location: Location?
    
    func makeTaskFromDraft () -> Task {
        return Task(
            id: UUID(),
            title: self.title,
            shortDescription: self.shortDescription,
            phoneNumber: self.phoneNumber,
            dueDate: self.dueDate,
            reminder: self.reminder,
            isUrgency: self.isUrgency,
            isCompleted: false,
            repeatRule: self.repeatRule,
            subTasks: self.subTasks,
            media: self.media,
            location: self.location
        )
    }
    
}


