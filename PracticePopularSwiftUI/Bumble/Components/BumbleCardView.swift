//
//  BumbleCardView.swift
//  PracticePopularSwiftUI
//
//  Created by G Zhen on 12/6/24.
//

import SwiftUI

struct BumbleCardView: View {
    var user: User = .mock
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                header
                    .frame(height: 700)
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 32))
        .scrollIndicators(.hidden)
    }
    
    private var header: some View {
        ZStack(alignment: .bottomLeading) {
            ImageLoaderView(imageName: user.image)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("\(user.firstName) \(user.age)")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                HStack(spacing: 4) {
                    Image(systemName: "suitcase")
                    Text(user.work)
                }
                HStack(spacing: 4) {
                    Image(systemName: "graduationcap")
                    Text(user.education)
                }
                BumbleHeartView()
                    .asButton {
                        
                    }
            }
            .padding(24)
            .font(.callout)
            .fontWeight(.medium)
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundStyle(.bumbleWhite)
            .background(
                LinearGradient(
                    colors: [
                        .bumbleBlack.opacity(0),
                        .bumbleBlack.opacity(0.6),
                        .bumbleBlack.opacity(0.6)
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
        }
    }
}

#Preview {
    BumbleCardView()
        .padding(.vertical, 40)
        .padding(.horizontal, 16)
}
