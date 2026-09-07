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
    @FocusState private var isTitleFocused: Bool
    @State private var description = ""
    @State private var showDiscardAlert = false
    
    @State private var isReminderEnabled = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    TaskOptionGroup {
                        TextField("Назва задачі", text: $title, axis: .vertical)
                            .focused($isTitleFocused)
                            .font(.title3.bold())
                            .padding()
                        Divider()
                        TextField("Опис", text: $description, axis: .vertical)
                            .foregroundStyle(.secondary)
                            .padding()
                    }
                    
                    VoiceMessageCell()
                    DateTimeOptionsView()
                    ResourceOptionsView()
                    AdditionalOptionsView()
                }
                .padding(.top, 4)
            }
            .scrollDismissesKeyboard(.interactively)
            .background(appBackgroundColorAddTask)
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                isTitleFocused = true
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
                            .foregroundStyle(title.isEmpty ? .secondary : appBackgroundColor)
                    }
                    .buttonStyle(.glassProminent)
                    .tint(title.isEmpty ? .white : appAccentColor)
                    .disabled(title.isEmpty)
                }
            }
        }
        .alert("Ви дійсно бажаєте закрити? Задача буде не збережена.", isPresented: $showDiscardAlert) {
            Button("Залишитись") {}
            Button("Вийти") { dismiss() }
        }
    }
}
