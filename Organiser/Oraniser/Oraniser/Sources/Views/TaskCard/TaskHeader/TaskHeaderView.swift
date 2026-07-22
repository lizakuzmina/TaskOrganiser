//
//  TaskHeaderView.swift
//  Oraniser
//
//  Created by Yelyzaveta Kuzmina on 22.07.2026.
//

import SwiftUI

struct TaskHeaderView: View {
    let title: String
    let description: String?

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
                .fontWeight(.semibold)
                .lineLimit(1)
            
            if let description {
                Text(description)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .lineLimit(3)
            }
        }
    }
}

#Preview {
    TaskHeaderView(
        title: "Buy groceries",
        description: "Milk, eggs, bread, fruits and vegetables for the week."
    )
}
