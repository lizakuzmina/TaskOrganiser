//
//  TaskViewModel.swift
//  Oraniser
//
//  Created by Yelyzaveta Kuzmina on 17.07.2026.
//

import Foundation
import Combine

class TaskViewModel: ObservableObject {
    init(service: any TaskServicing) {
        self.service = service
    }
    
    @Published var tasks: [Task] = []
    @Published var error: Error?
    
    private let service: TaskServicing
    
    func loadTasks() {
        do {
            let loadedTasks = try service.loadTasks()
            tasks = loadedTasks
        } catch {
            self.error = error
        }
    }
    
    func addTask (_ task: Task) {
        do {
            try service.addTask(task)
            loadTasks()
        } catch {
            self.error = error
        }
    }
    
    func deleteTask (id: UUID) {
        do {
            try service.deleteTask(id: id)
            loadTasks()
        } catch {
            self.error = error
        }
    }
    
    func updateTask () {
        do {
            try service.updateTask()
            loadTasks()
        } catch {
            self.error = error
        }
    }
    
    func markCompleted(id: UUID) {
        do {
            try service.markCompleted(id: id)
            loadTasks()
        } catch {
            self.error = error
        }
    }
}
