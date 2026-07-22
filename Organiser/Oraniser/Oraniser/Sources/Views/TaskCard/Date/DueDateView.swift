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

        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy, HH:mm"

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
