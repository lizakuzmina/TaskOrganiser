//
//  TaskService.swift
//  Oraniser
//
//  Created by Yelyzaveta Kuzmina on 17.07.2026.
//

import Foundation

protocol TaskServicing {
    func loadTasks() -> [Task]
    func addTask(_ task: Task)
    func updateTask(_ task: Task)
    func deleteTask(id: UUID)
//    func toggleCompleted(id: UUID)
}

final class TaskService: TaskServicing {
    init(store: any TaskStoring) {
        self.store = store
    }
    
    private let store: TaskStoring
    
    func loadTasks() -> [Task] {
        store.loadTasks()
    }
    func addTask(_ task: Task) {
        store.saveTask(task)
    }
    func updateTask(_ task: Task) {
        store.updateTask(task)
    }
    func deleteTask(id: UUID) {
        store.deleteTask(id: id)
    }
}
