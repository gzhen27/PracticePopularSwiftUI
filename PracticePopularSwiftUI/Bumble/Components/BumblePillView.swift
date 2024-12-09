//
//  BumblePillView.swift
//  PracticePopularSwiftUI
//
//  Created by G Zhen on 12/6/24.
//

import SwiftUI

struct BumblePillView: View {
    var iconName: String?
    var emoji: String?
    var text: String = "Home Degree"
    var verticalPadding: CGFloat = 6
    var horizontalPadding: CGFloat = 12
    var foregroundColor: Color = .bumbleBlack
    var backgroundColor: Color = .bumbleLightYellow
    
    var body: some View {
        HStack(spacing: 4) {
            if let iconName {
                Image(systemName: iconName)
            } else if let emoji {
                Text(emoji)
            }
            
            Text(text)
        }
        .font(.callout)
        .fontWeight(.medium)
        .padding(.vertical, verticalPadding)
        .padding(.horizontal, horizontalPadding)
        .foregroundStyle(foregroundColor)
        .background(backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 32))
    }
}

#Preview {
    VStack {
        BumblePillView(iconName: "heart.fill")
        BumblePillView(emoji: "🐰")
    }
}
