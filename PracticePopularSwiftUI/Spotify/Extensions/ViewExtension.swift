//
//  ViewExtension.swift
//  PracticePopularSwiftUI
//
//  Created by G Zhen on 11/24/24.
//
import SwiftUI

extension View {
    
    /// Wrap a View in a Button and add a custom ButtonStyle
    func asButton(scale: CGFloat = 0.95, opacity: Double = 1, brightness: Double = 0, action: @escaping () -> Void) -> some View {
        Button {
            action()
        } label: {
            self
        }
        .buttonStyle(ButtonStyleViewModifier(scale: scale, opacity: opacity, brightness: brightness))
    }
    
    func themeColor(isSelected: Bool = false) -> some View {
        self
            .background(isSelected ? .spotifyGreen : .spotifyDarkGray)
            .foregroundStyle(isSelected ? Color.spotifyBlack : .spotifyWhite)
    }
}

struct ButtonStyleViewModifier: ButtonStyle {
    let scale: CGFloat
    let opacity: Double
    let brightness: Double
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? scale : 1)
            .opacity(configuration.isPressed ? opacity : 1)
            .brightness(configuration.isPressed ? brightness : 0)
    }
}
