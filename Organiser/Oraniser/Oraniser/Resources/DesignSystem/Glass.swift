//
//  Glass.swift
//  Oraniser
//
//  Created by Yelyzaveta Kuzmina on 22.07.2026.
//

import SwiftUI

// MARK: - View Extension

extension View {

    func glassCard(cornerRadius: CGFloat = 24) -> some View {
        modifier(
            GlassCardModifier(
                cornerRadius: cornerRadius
            )
        )
    }

}

// MARK: - Glass Card

struct GlassCardModifier: ViewModifier {

    let cornerRadius: CGFloat

    func body(content: Content) -> some View {

        let shape = RoundedRectangle(
            cornerRadius: cornerRadius,
            style: .continuous
        )

        if #available(iOS 26, *) {

            content
                .glassEffect(
                    .regular,
                    in: shape
                )

        } else {

            content
                .background(
                    .ultraThinMaterial,
                    in: shape
                )
                .overlay {
                    shape
                        .stroke(
                            .white.opacity(0.15),
                            lineWidth: 1
                        )
                }
                .shadow(
                    color: .black.opacity(0.08),
                    radius: 10,
                    x: 0,
                    y: 4
                )

        }
    }
}
// MARK: - Glass Circle

extension View {
    func glassCircle(
        size: CGFloat = 36,
        tint: Color? = nil
    ) -> some View {
        self.modifier(
            GlassCircleModifier(
                size: size,
                tint: tint
            )
        )
    }
}

struct GlassCircleModifier: ViewModifier {
    let size: CGFloat
    let tint: Color?

    func body(content: Content) -> some View {
        if #available(iOS 26, *) {
            if let tint {
                content
                    .frame(width: size, height: size)
                    .glassEffect(
                        .regular.tint(tint).interactive(),
                        in: Circle()
                    )
            } else {
                content
                    .frame(width: size, height: size)
                    .glassEffect(
                        .regular.interactive(),
                        in: Circle()
                    )
            }
        } else {
            content
                .frame(width: size, height: size)
                .background(
                    tint?.opacity(0.9) ?? .clear,
                    in: Circle()
                )
                .background(
                    .ultraThinMaterial,
                    in: Circle()
                )
                .overlay {
                    Circle()
                        .stroke(
                            tint?.opacity(0.25) ?? .white.opacity(0.18),
                            lineWidth: 1
                        )
                }
        }
    }
}
