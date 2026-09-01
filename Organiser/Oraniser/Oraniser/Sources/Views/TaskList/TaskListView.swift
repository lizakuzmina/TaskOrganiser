//
//  MyNotes.swift
//  Oraniser
//
//  Created by Yelyzaveta Kuzmina on 06.06.2026.
//

import SwiftUI

struct TaskListView: View {
    
    @ObservedObject var viewModel: TaskViewModel
    @State var showAddTask: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomTrailing) {
                appBackgroundGradient
                    .ignoresSafeArea()
                ScrollView {
                    LazyVStack {
                        ForEach(viewModel.tasks) { task in
                            TaskCardView(task: task)
                        }
                    }
                    .onAppear {
                        viewModel.loadTasks()
                    }
                }

                AddTaskButton(showAddTask: $showAddTask)
                    .padding()
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                    } label: {
                        Image(systemName: "line.3.horizontal")
                    }
                }

                ToolbarItem(placement: .principal) {
                    Text("Мої задачі")
                        .font(.headline)
                }

                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                    } label: {
                        Image(systemName: "magnifyingglass")
                    }
                }
            }
        }
        .sheet(isPresented: $showAddTask) {
            AddTaskView()
        }
        
    }
}

#Preview {
    @Previewable @State var showAddTask = false
    
    AddTaskButton(showAddTask: $showAddTask)
}
