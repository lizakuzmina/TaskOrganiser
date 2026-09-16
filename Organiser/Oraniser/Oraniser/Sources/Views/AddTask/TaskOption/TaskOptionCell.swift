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
    let isDisabled: Bool
    @Binding var isOn: Bool
    
    @ViewBuilder let content: () -> Content
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Image(systemName: icon)
                    .foregroundStyle(isDisabled ? .secondary : .primary)
                    .frame(width: 22)
                    
                Text(title)
                    .foregroundStyle(isDisabled ? .secondary : .primary)
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
