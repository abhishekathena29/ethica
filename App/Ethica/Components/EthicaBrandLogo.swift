//
//  EthicaBrandLogo.swift
//  Ethica
//
//  Shared brand logo / mark used across auth and app chrome.
//

import SwiftUI

enum EthicaBrandLogoStyle {
    /// Full wordmark + emblem (`EthicaLogo`)
    case full
    /// Shield emblem only (`EthicaLogoMark`) — best for app chrome / auth hero
    case mark
}

struct EthicaBrandLogo: View {
    var style: EthicaBrandLogoStyle = .mark
    var height: CGFloat = 100
    var showTagline: Bool = false
    var tagline: String = "Embracing Ahimsa"

    var body: some View {
        VStack(spacing: Spacing.sm) {
            Image(style == .full ? "EthicaLogo" : "EthicaLogoMark")
                .resizable()
                .scaledToFit()
                .frame(height: height)
                .accessibilityHidden(true)

            if showTagline && style == .mark {
                // Wordmark is already inside EthicaLogo; only show title for mark style.
                Text("Ethica")
                    .font(.system(size: max(28, height * 0.42), weight: .bold, design: .rounded))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [.white, .white.opacity(0.9)],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )

                Text(tagline)
                    .font(.system(size: 16, weight: .medium, design: .rounded))
                    .foregroundColor(.white.opacity(0.7))
                    .tracking(2)
            } else if showTagline && style == .full {
                Text(tagline)
                    .font(.system(size: 16, weight: .medium, design: .rounded))
                    .foregroundColor(.white.opacity(0.7))
                    .tracking(2)
            }
        }
        .accessibilityElement(children: .combine)
        .accessibilityLabel(showTagline ? "Ethica, \(tagline.lowercased())" : "Ethica")
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        VStack(spacing: 40) {
            EthicaBrandLogo(style: .mark, height: 120, showTagline: true)
            EthicaBrandLogo(style: .full, height: 160, showTagline: true)
        }
    }
}
