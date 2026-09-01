//
//  AppCoordinator.swift
//  Oraniser
//
//  Created by Yelyzaveta Kuzmina on 18.08.2026.
//

import Foundation
import SwiftData

final class Coordinator {

    let container: ModelContainer
    let context: ModelContext
    let store: TaskStore
    let service: TaskService
    let viewModel: TaskViewModel
    let taskListView: TaskListView

    init() {
        container = try! ModelContainer(
            for: Task.self,
            SubTask.self,
            Media.self,
            Location.self
        )

        context = container.mainContext
        store = TaskStore(modelContext: context)
        service = TaskService(store: store)
        viewModel = TaskViewModel(service: service)
        taskListView = TaskListView(viewModel: viewModel)
    }
}
