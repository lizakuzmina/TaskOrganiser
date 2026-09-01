//
//  AddTaskButton.swift
//  Oraniser
//
//  Created by Yelyzaveta Kuzmina on 26.08.2026.
//

import SwiftUI


struct AddTaskButton: View {
    
    @Binding var showAddTask: Bool
    
    var body: some View {
        Button {
            showAddTask = true
        } label: {
            Image(systemName: "plus")
                .foregroundStyle(.backgroundTop)
                .font(.title)
                .bold()
                
        }
        .glassCircle(size: 56, tint: appAccentColor)
    }
}

//#Preview {
//    AddTaskButton(showAddTask: $showAddTask)
//}

