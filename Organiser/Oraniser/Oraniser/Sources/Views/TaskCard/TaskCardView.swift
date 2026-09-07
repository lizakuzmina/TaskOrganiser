//
//  TaskCardView.swift
//  Oraniser
//
//  Created by Yelyzaveta Kuzmina on 22.07.2026.
//

import SwiftUI

struct TaskCardView: View {
    let task: Task
    var body: some View {
        VStack (alignment: .leading, spacing: 10) {
            TaskHeaderView(title: task.title, description: task.shortDescription)
            TaskIconsView(phone: task.phoneNumber, location: task.location, filesCount: task.media.count, subtasksCount: task.subTasks.count)
            HStack {
                DueDateView(dueDate: task.dueDate)
                Spacer()
                VoiceMessageButton()
            }
        } .padding()
            .glassCard()
            .padding(.horizontal)
    }
}

#Preview {

    TaskCardView(
        task: Task(
            id: UUID(),
            title: "Buy groceries",
            shortDescription: "Milk, eggs, vegetables and coffee",
            phoneNumber: "+380991234567",
            dueDate: .now,
            isUrgency: true,
            isCompleted: false,
            repeatRule: nil,
            subTasks: [],
            media: [],
            location: nil
        )
    )
    .padding()
    .background(Color.gray.opacity(0.15))

}
