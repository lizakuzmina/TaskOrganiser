//
//  DateTimeOptionsView.swift
//  Oraniser
//
//  Created by Yelyzaveta Kuzmina on 07.09.2026.
//

import SwiftUI

struct DateTimeOptionsView: View {
    
    @State private var isDateEnabled = false
    @State private var isTimeEnabled = false
    @State private var isReminderEnabled = false
    @State private var isUrgencyEnabled = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Дата та час")
                .font(.footnote)
                .foregroundStyle(.secondary)
                .padding(.horizontal, 28)
            
            TaskOptionGroup {
                TaskOptionCell(
                    title: "Дата",
                    icon: "calendar",
                    isOn: $isDateEnabled) {
                        Text("")
                    }
                Divider()
                TaskOptionCell(
                    title: "Час",
                    icon: "clock",
                    isOn: $isTimeEnabled) {
                        Text("")
                    }
                Divider()
                TaskOptionCell(
                    title: "Нагадування",
                    icon: "bell.fill",
                    isOn: $isReminderEnabled) {
                        Text("")
                    }
                Divider()
                TaskOptionCell(
                    title: "Терміново",
                    icon: "exclamationmark.circle.fill",
                    isOn: $isUrgencyEnabled) {
                        Text("")
                    }
            }
        }
    }
}

#Preview {
    DateTimeOptionsView()
}
