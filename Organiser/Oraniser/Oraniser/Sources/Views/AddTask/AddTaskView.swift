//
//  AddTaskView.swift
//  Oraniser
//
//  Created by Yelyzaveta Kuzmina on 01.09.2026.
//

import SwiftUI

struct AddTaskView: View {
    
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewModel: TaskViewModel
    @State private var title = ""
    @State private var showDiscardAlert = false
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Назва задачі", text: $title)
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        if title.isEmpty {
                            dismiss()
                        } else {
                            showDiscardAlert = true
                        }
                    } label: {
                        Image(systemName: "xmark")
                    }
                }

                ToolbarItem(placement: .principal) {
                    Text("Нова задача")
                        .font(.headline)
                }

                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        let task = Task(id: UUID(), title: title, isCompleted: false, subTasks: [], media: [])
                        viewModel.addTask(task)
                        dismiss()
                    }
                    label: {
                        Image(systemName: "checkmark")
                    }
                    .disabled(title.isEmpty)
                    .glassCircle(size: 36, tint: title.isEmpty ? nil : appAccentColor)
                }
            }
        }.alert("Ви дійсно бажаєте закрити? Задача буде не збережена.", isPresented: $showDiscardAlert) {
            Button("Залишитись") {}
            Button("Вийти") { dismiss() }
        }
    }
}

//#Preview {
//    AddTaskView()
//}
