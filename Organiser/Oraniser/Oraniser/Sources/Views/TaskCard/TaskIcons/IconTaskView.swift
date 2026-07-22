//
//  IconTaskView.swift
//  Oraniser
//
//  Created by Yelyzaveta Kuzmina on 22.07.2026.
//

import SwiftUI

struct IconTaskView: View {
    let icon: TaskIcon
    let count: Int?

    var body: some View {
        HStack(spacing: 4) {
            Image(systemName: icon.systemImage)

            if let count {
                Text("\(count)")
            }
        }
        .font(.caption)
        .fontWeight(.medium)
        .foregroundStyle(.accent)
        .padding(.horizontal, 8)
        .padding(.vertical, 6)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.colorIconsTask)
        )
    }
}

enum TaskIcon {
    case phone
    case location
    case files
    case subtasks
    
    var systemImage: String {
        switch self {
        case .phone: return "phone.fill"
        case .location: return "mappin.circle.fill"
        case .files: return "paperclip"
        case .subtasks: return "checklist"
        }
    }
}

