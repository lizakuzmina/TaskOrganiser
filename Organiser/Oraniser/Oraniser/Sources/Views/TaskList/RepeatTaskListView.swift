//
//  MyNotes.swift
//  Oraniser
//
//  Created by Yelyzaveta Kuzmina on 06.06.2026.
//

import SwiftUI

struct RepeatTaskListView: View {
    
    @ObservedObject var viewModel: TaskViewModel
    @State var showAddTask: Bool = false
    @Binding var showRepeatingTasks: Bool
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomTrailing) {
                appBackgroundGradient
                    .ignoresSafeArea()
                ScrollView {
                    LazyVStack {
                        ForEach(viewModel.tasks.filter { $0.repeatRule != nil } ) { task in
                            TaskCardView(task: task)
                        }
                    }
                    .onAppear {
                        viewModel.loadTasks()
                    }
                }.navigationBarTitleDisplayMode(.inline)

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
                    Menu {
                        Button("Мої задачі") {
                            showRepeatingTasks = false
                        }

                        Button("Повторювані") {
                            showRepeatingTasks = true
                        }
                    } label: {
                        HStack(spacing: 4) {
                            Text(showRepeatingTasks ? "Повторювані задачі" : "Мої задачі")
                                .font(.headline)

                            Image(systemName: "chevron.down")
                                .font(.caption)
                        }
                    }
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
            AddTaskView(viewModel: viewModel, showRepeatingTasks: $showRepeatingTasks)
        }
        
    }
}
