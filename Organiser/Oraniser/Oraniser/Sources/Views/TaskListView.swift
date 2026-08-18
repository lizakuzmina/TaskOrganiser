//
//  MyNotes.swift
//  Oraniser
//
//  Created by Yelyzaveta Kuzmina on 06.06.2026.
//

import SwiftUI

struct TaskListView: View {
    
    @ObservedObject var viewModel: TaskViewModel
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.tasks) { task in
                    TaskCardView(task: task)
                }
            }.onAppear {
                viewModel.loadTasks()
            }
        }
    }
}
//
//#Preview {
//    TaskListView()
//}
