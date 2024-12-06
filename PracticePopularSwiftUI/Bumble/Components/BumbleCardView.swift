//
//  BumbleCardView.swift
//  PracticePopularSwiftUI
//
//  Created by G Zhen on 12/6/24.
//

import SwiftUI

struct BumbleCardView: View {
    var user: User = .mock
    
    @State private var cardFrame: CGRect = .zero
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
//                header
//                    .frame(height: cardFrame.height)
                
                aboutMe
                    .padding(24)
                
                myInterests
                    .padding(24)
                
                ForEach(user.images, id: \.self) { img in
                    ImageLoaderView(imageName: img)
                        .frame(height: cardFrame.height)
                }
            }
        }
        .scrollIndicators(.hidden)
        .background(.bumbleBGYellow)
        .clipShape(RoundedRectangle(cornerRadius: 32))
        .readingFrame { frame in
            cardFrame = frame
        }
    }
    
    private func sectionTitle(_ title: String) -> some View {
        Text(title)
            .font(.body)
            .foregroundStyle(.bumbleGray)
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
    
    private var aboutMe: some View {
        VStack(alignment: .leading, spacing: 12) {
            sectionTitle("About me")
            
            Text(user.aboutMe)
                .font(.body)
                .fontWeight(.semibold)
                .foregroundStyle(.bumbleBlack)
            
            HStack(spacing: 0) {
                BumbleHeartView()
                
                Text("Send a Compliment")
                    .font(.caption)
                    .fontWeight(.semibold)
            }
            .padding(.horizontal, 8)
            .padding(.trailing, 8)
            .background(.bumbleYellow)
            .clipShape(RoundedRectangle(cornerRadius: 32))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var myInterests: some View {
        VStack(alignment: .leading, spacing: 12) {
            VStack(alignment: .leading, spacing: 8) {
                sectionTitle("My basic")
                BumblePillGridView(interests: user.basics)
            }
            VStack(alignment: .leading, spacing: 8) {
                sectionTitle("My interests")
                BumblePillGridView(interests: user.interests)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    BumbleCardView()
        .padding(.vertical, 40)
        .padding(.horizontal, 16)
}
