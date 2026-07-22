//
//  TaskService.swift
//  Oraniser
//
//  Created by Yelyzaveta Kuzmina on 17.07.2026.
//

import Foundation

protocol TaskServicing {
    func loadTasks() throws -> [Task]
    func addTask(_ task: Task) throws
    func updateTask() throws
    func deleteTask(id: UUID) throws
    func markCompleted(id: UUID) throws
}

final class TaskService: TaskServicing {
    init(store: any TaskStoring) {
        self.store = store
    }
    
    private let store: TaskStoring
    
    func loadTasks() throws -> [Task] {
        try store.loadTasks()
    }
    func addTask(_ task: Task) throws {
        try store.saveTask(task)
    }
    func updateTask() throws {
        try store.saveChanges()
    }
    func deleteTask(id: UUID) throws {
        try store.deleteTask(id: id)
    }
    func markCompleted(id: UUID) throws {
        try store.markCompleted(id: id)
    }
}
