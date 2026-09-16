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
    @State private var draft = TaskDraft(title: "", shortDescription: "")
    @FocusState private var isTitleFocused: Bool
    @State private var showDiscardAlert = false
    @Binding var showRepeatingTasks: Bool
    @State private var isReminderEnabled = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    TaskOptionGroup {
                        TextField("Назва задачі", text: $draft.title, axis: .vertical)
                            .focused($isTitleFocused)
                            .font(.title3.bold())
                            .padding()
                        Divider()
                        TextField("Опис", text: $draft.shortDescription, axis: .vertical)
                            .foregroundStyle(.secondary)
                            .padding()
                    }
                    
                    VoiceMessageCell()
                    DateTimeOptionsView(draft: $draft)
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
                        if draft.title.isEmpty {
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
                        let task = draft.makeTaskFromDraft()
                        viewModel.addTask(task)
                        dismiss()
                        showRepeatingTasks = draft.repeatRule != nil
                    }
                    label: {
                        Image(systemName: "checkmark")
                            .foregroundStyle(draft.title.isEmpty ? .secondary : appBackgroundColor)
                    }
                    .buttonStyle(.glassProminent)
                    .tint(draft.title.isEmpty ? .white : appAccentColor)
                    .disabled(draft.title.isEmpty)
                }
            }
        }
        .alert("Ви дійсно бажаєте закрити? Задача буде не збережена.", isPresented: $showDiscardAlert) {
            Button("Залишитись") {}
            Button("Вийти") { dismiss() }
        }
    }
}
