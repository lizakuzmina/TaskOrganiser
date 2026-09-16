//
//  TaskListContainerView.swift
//  Oraniser
//
//  Created by Yelyzaveta Kuzmina on 15.09.2026.
//

import SwiftUI

struct TaskListContainerView: View {
    @ObservedObject var viewModel: TaskViewModel

    @State private var showRepeatingTasks = false

    var body: some View {
        if showRepeatingTasks {
            RepeatTaskListView(viewModel: viewModel, showRepeatingTasks: $showRepeatingTasks)
        } else {
            TaskListView(viewModel: viewModel, showRepeatingTasks: $showRepeatingTasks)
        }
    }
}
