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
        VStack(alignment: .leading, spacing: 10) {
            TaskHeaderView(
                title: task.title,
                description: task.shortDescription
            )

            TaskIconsView(
                phone: task.phoneNumber,
                location: task.location,
                filesCount: task.media.count,
                subtasksCount: task.subTasks.count
            )

            HStack {
                
                HStack(spacing: 5)  {
                    if let repeatRule = task.repeatRule {
                        Image(systemName: "repeat")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                                Text("\(repeatRule.title),")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                }
                
                DueDateView(dueDate: task.dueDate)

                Spacer()

                VoiceMessageButton()
            }
        }
        .padding()
        .glassCard()
        .overlay {
            if task.isUrgency {
                RoundedRectangle(cornerRadius: 24, style: .continuous)
                    .stroke(appAccentColor, lineWidth: 1)
            }
        }
        .overlay(alignment: .topTrailing) {
            if task.isUrgency {
                Image(systemName: "bell.and.waves.left.and.right")
                    .font(.system(size: 20))
                    .foregroundStyle(appAccentColor)
                    .rotationEffect(.degrees(25))
                    .padding(20)
            }
        }
        .padding(.horizontal)
    }
}
