//
//  TaskOptionGroup.swift
//  Oraniser
//
//  Created by Yelyzaveta Kuzmina on 07.09.2026.
//

import SwiftUI

struct TaskOptionGroup<Content: View>: View {
    @ViewBuilder let content: () -> Content

    var body: some View {
        VStack(spacing: 0) {
            content()
        }
        .glassCard()
        .padding(.horizontal)
    }
}
