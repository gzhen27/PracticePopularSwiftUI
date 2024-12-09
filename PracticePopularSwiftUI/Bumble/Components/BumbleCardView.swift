//
//  BumbleCardView.swift
//  PracticePopularSwiftUI
//
//  Created by G Zhen on 12/6/24.
//

import SwiftUI

struct BumbleCardView: View {
    var user: User = .mock
    var onSuperLikePressed: (() -> Void)? = nil
    var onXmarkPressed: (() -> Void)? = nil
    var onCheckmarkPressed: (() -> Void)? = nil
    var onSendAComplimentPresssed: (() -> Void)? = nil
    var onHideAndReportPressed: (() -> Void)? = nil
    
    @State private var cardFrame: CGRect = .zero
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                header
                    .frame(height: cardFrame.height)
                
                aboutMe
                    .padding(24)
                
                myInterests
                    .padding(.horizontal, 24)
                    .padding(.bottom, 24)
                
                myImages
                
                myLocation
                    .padding(24)
                
                footerSection
                    .padding(.horizontal, 36)
                    .padding(.bottom, 60)
            }
        }
        .scrollIndicators(.hidden)
        .background(.bumbleBGYellow)
        .overlay(superLikeButton, alignment: .bottomTrailing)
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
    
    private func cardButtonView(_ iconName: String) -> some View {
        Circle()
            .fill(.bumbleYellow)
            .overlay {
                Image(systemName: iconName)
                    .font(.title)
                    .fontWeight(.semibold)
            }
            .frame(width: 50, height: 50)
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
            .asButton {
                onSendAComplimentPresssed?()
            }
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
    
    private var myImages: some View {
        ForEach(user.images, id: \.self) { img in
            ImageLoaderView(imageName: img)
                .frame(height: cardFrame.height)
        }
    }
    
    private var myLocation: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 8) {
                Image(systemName: "mappin.and.ellipse.circle.fill")
                Text(user.firstName + "'s Location")
            }
            .foregroundStyle(.bumbleGray)
            .font(.body)
            .fontWeight(.medium)
            
            Text("999999 mile away")
                .font(.headline)
                .foregroundStyle(.bumbleBlack)
            
            BumblePillView(emoji: "🇱🇷", text: "Lives in United States")
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var footerSection: some View {
        VStack(spacing: 24) {
            HStack(spacing: 0) {
                cardButtonView("xmark")
                    .asButton {
                        onXmarkPressed?()
                    }
                
                Spacer(minLength: 0)
                
                cardButtonView("checkmark")
                    .asButton {
                        onCheckmarkPressed?()
                    }
            }
            
            Text("Hide and Report")
                .font(.headline)
                .foregroundStyle(.bumbleGray)
                .padding(8)
                .background(.bumbleBlack.opacity(0.001))
                .onTapGesture {
                    onHideAndReportPressed?()
                }
        }
    }
    
    private var superLikeButton: some View {
        Image(systemName: "hexagon.fill")
            .foregroundStyle(.bumbleYellow)
            .font(.system(size: 60))
            .overlay(
                Image(systemName: "star.fill")
                    .foregroundStyle(.bumbleBlack)
                    .font(.system(size: 30, weight: .medium))
            )
            .padding(24)
            .asButton {
                onSuperLikePressed?()
            }
    }
}

#Preview {
    BumbleCardView()
        .padding(.vertical, 40)
        .padding(.horizontal, 16)
}
