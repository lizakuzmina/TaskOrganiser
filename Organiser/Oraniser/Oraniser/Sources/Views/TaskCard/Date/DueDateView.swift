//
//  DateView.swift
//  Oraniser
//
//  Created by Yelyzaveta Kuzmina on 22.07.2026.
//

import SwiftUI

struct DueDateView: View {
    let dueDate: Date?

    private var formattedDate: String? {
        guard let dueDate else { return nil }

        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: dueDate)
        let minute = calendar.component(.minute, from: dueDate)

        let formatter = DateFormatter()

        if hour == 0 && minute == 0 {
            formatter.dateFormat = "dd.MM.yyyy"
        } else {
            formatter.dateFormat = "dd.MM.yyyy, HH:mm"
        }

        return formatter.string(from: dueDate)
    }

    var body: some View {
        if let formattedDate {
            Text(formattedDate)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }
}
