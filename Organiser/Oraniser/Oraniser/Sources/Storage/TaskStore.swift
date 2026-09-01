//
//  TaskStore.swift
//  Oraniser
//
//  Created by Yelyzaveta Kuzmina on 17.07.2026.
//

import Foundation
import SwiftData

protocol TaskStoring {
    func loadTasks() throws -> [Task]
    func saveTask(_ task: Task) throws
    func deleteTask(id: UUID) throws
    func saveChanges() throws
    func markCompleted(id: UUID) throws
}

final class TaskStore: TaskStoring {
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }
    
    private let modelContext: ModelContext
    
    func saveTask(_ task: Task) throws {
        modelContext.insert(task)
        try saveChanges()
    }
    
    func loadTasks() throws -> [Task] {
        let descriptor = FetchDescriptor<Task>(
            sortBy: [
                SortDescriptor(\.createdAt, order: .reverse)
            ]
        )
        let tasks = try modelContext.fetch(descriptor)
        return tasks
    }
    
    func deleteTask(id: UUID) throws {
        guard let task = try findTask(id: id) else {
            throw TaskStoreError.taskNotFound
        }
        modelContext.delete(task)
        try saveChanges()
    }
    
        func saveChanges() throws {
            try modelContext.save()
        }
        
        private func findTask(id: UUID) throws -> Task? {
            let descriptor = FetchDescriptor<Task>(
                predicate: #Predicate { task in
                    task.id == id
                }
            )
            let tasks = try modelContext.fetch(descriptor)
            return tasks.first
        }
    
    func markCompleted(id: UUID) throws {
        guard let task = try findTask(id: id) else {
            throw TaskStoreError.taskNotFound
        }
        task.isCompleted = true
        try saveChanges()
    }
        
    }

    enum TaskStoreError: Error {
        case taskNotFound
    }


