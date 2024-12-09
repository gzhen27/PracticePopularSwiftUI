//
//  BumbleProfileImageView.swift
//  PracticePopularSwiftUI
//
//  Created by G Zhen on 12/8/24.
//

import SwiftUI

struct BumbleProfileImageView: View {
    var imageName: String = Constants.staticImage
    var percentageRemaining: Double = Double.random(in: 0...1)
    var hasNewMessage: Bool = false
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(.bumbleGray, lineWidth: 2)
            Circle()
                .trim(from: 0, to: percentageRemaining)
                .stroke(.bumbleYellow, lineWidth: 4)
                .rotationEffect(Angle(degrees: -90))
                .scaleEffect(x: -1, y: 1, anchor: .center)
            
            ImageLoaderView(imageName: imageName)
                .clipShape(Circle())
                .padding(5)
        }
        .frame(width: 75, height: 75)
        .overlay(
            ZStack {
                if hasNewMessage {
                    Circle()
                        .fill(.bumbleWhite)
                    
                    Circle()
                        .fill(.bumbleYellow)
                        .padding(4)
                }
            }
            .frame(width: 24, height: 24)
            .offset(x: 2, y: 2)
            , alignment: .bottomTrailing
        )
    }
}

#Preview {
    VStack(spacing: 8) {
        BumbleProfileImageView()
        BumbleProfileImageView(percentageRemaining: 1)
        BumbleProfileImageView(percentageRemaining: 0)
        BumbleProfileImageView(hasNewMessage: true)
    }
}
