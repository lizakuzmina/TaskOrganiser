//
//  VoiceMessageButton.swift
//  Oraniser
//
//  Created by Yelyzaveta Kuzmina on 22.07.2026.
//

import SwiftUI

struct VoiceMessageButton: View {
    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: "waveform")

            Text("Voice")
        }
        .font(.caption)
        .foregroundColor(Color.background)
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .background(
            Capsule()
                .fill(Color.backgroundBottom)
        )
    }
}

#Preview {
    VoiceMessageButton()
}
