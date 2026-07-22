//
//  TaskIconsView.swift
//  Oraniser
//
//  Created by Yelyzaveta Kuzmina on 22.07.2026.
//

import SwiftUI

struct TaskIconsView: View {
    
    let phone: String?
    let location: Location?
    let filesCount: Int
    let subtasksCount: Int
    
    var body: some View {
        HStack (spacing: 3) {
            if phone != nil {
                IconTaskView(icon: .phone, count: nil)
            }
            if location != nil {
                IconTaskView(icon: .location, count: nil)
            }
            if filesCount > 0 {
                IconTaskView(icon: .files, count: filesCount)
            }
            if subtasksCount > 0 {
                IconTaskView(icon: .subtasks, count: subtasksCount)
            }
        }
    }
}

//#Preview {
//    TaskIconsView()
//}
