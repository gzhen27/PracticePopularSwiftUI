//
//  BumbleChatPreviewView.swift
//  PracticePopularSwiftUI
//
//  Created by G Zhen on 12/8/24.
//

import SwiftUI

struct BumbleChatPreviewView: View {
    var imageName: String = Constants.staticImage
    var percentageRemaining: Double = Double.random(in: 0...1)
    var hasNewMessage: Bool = false
    var userName: String = "G"
    var lastChatMessage: String? = "This is a really long and useless message that has no meaningful content"
    var isYourMove: Bool = false
    
    var body: some View {
        HStack {
            BumbleProfileImageView(
                imageName: imageName,
                percentageRemaining: percentageRemaining,
                hasNewMessage: hasNewMessage
            )
            
            VStack(alignment: .leading) {
                HStack {
                    Text(userName)
                        .font(.headline)
                        .foregroundStyle(.bumbleBlack)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    if isYourMove {
                        BumblePillView(
                            text: "YOUR MOVE",
                            font: .caption2,
                            fontWeight: .bold,
                            verticalPadding: 4,
                            horizontalPadding: 6,
                            backgroundColor: .bumbleYellow
                        )
                    }
                }
                if let lastChatMessage {
                    Text(lastChatMessage)
                        .foregroundStyle(.bumbleGray)
                }
            }
        }
        .lineLimit(1)
    }
}

#Preview {
    VStack {
        BumbleChatPreviewView()
        BumbleChatPreviewView(hasNewMessage: true)
        BumbleChatPreviewView(isYourMove: true)
    }
    .padding(.horizontal, 12)
}
