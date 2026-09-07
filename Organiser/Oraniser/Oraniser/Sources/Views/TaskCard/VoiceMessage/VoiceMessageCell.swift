//
//  VoiceMessageCell.swift
//  Oraniser
//
//  Created by Yelyzaveta Kuzmina on 03.09.2026.
//

import SwiftUI

struct VoiceMessageCell: View {
    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: "waveform")
            Text("Голосове повідомлення")
        }
        .padding()
        .glassCard()
        .padding(.horizontal)
    }
}

#Preview {
    VoiceMessageCell()
}
