//
//  ViewExtension.swift
//  PracticePopularSwiftUI
//
//  Created by G Zhen on 11/24/24.
//
import SwiftUI

extension View {
    func themeColor(isSelected: Bool = false) -> some View {
        self
            .background(isSelected ? .spotifyGreen : .spotifyDarkGray)
            .foregroundStyle(isSelected ? Color.spotifyBlack : .spotifyWhite)
    }
}
