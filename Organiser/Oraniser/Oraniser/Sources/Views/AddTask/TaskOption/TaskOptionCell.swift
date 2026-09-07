//
//  TaskOptionCell.swift
//  Oraniser
//
//  Created by Yelyzaveta Kuzmina on 03.09.2026.
//

import SwiftUI

struct TaskOptionCell<Content: View>: View {
    
    let title: String
    let icon: String
    @Binding var isOn: Bool
    
    @ViewBuilder let content: () -> Content
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Image(systemName: icon)
                    .frame(width: 22)
                Text(title)
                Spacer()
                Toggle("", isOn: $isOn)
                    .tint(appAccentColor)
            }
            .padding()
            
            if isOn {
                Divider()
                    .padding(.horizontal)
                content()
                    .padding()
            }
        }
    }
    
}
