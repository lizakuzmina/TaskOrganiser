//
//  TaskStore.swift
//  Oraniser
//
//  Created by Yelyzaveta Kuzmina on 17.07.2026.
//

import Foundation
import SwiftData

protocol TaskStoring {
    func loadTasks() -> [Task]
    func saveTask(_ task: Task)
    func deleteTask(id: UUID)
    func updateTask(_ task: Task)
}

final class TaskStore: TaskStoring {
    internal init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }
    
    private let modelContext: ModelContext
}
