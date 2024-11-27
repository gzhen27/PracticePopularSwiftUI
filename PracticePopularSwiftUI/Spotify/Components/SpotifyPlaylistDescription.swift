//
//  SpotifyPlaylistDescription.swift
//  PracticePopularSwiftUI
//
//  Created by G Zhen on 11/27/24.
//

import SwiftUI

struct SpotifyPlaylistDescription: View {
    var descriptionText: String = Product.mock.description
    var userName: String = "Admin"
    var subheadline: String = "This is the subheadline"
    var onAddtoPlaylistPressed: (() -> Void)? = nil
    var onSharePressed: (() -> Void)? = nil
    var onDownloadPressed: (() -> Void)? = nil
    var onEllipsisPressed: (() -> Void)? = nil
    var onShufflePressed: (() -> Void)? = nil
    var onPlayPressed: (() -> Void)? = nil
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(descriptionText)
                .frame(maxWidth: .infinity, alignment: .leading)
            makeForYouSection
            Text(subheadline)
            actionsRow
        }
        .font(.callout)
        .fontWeight(.medium)
        .foregroundStyle(.spotifyLightGray)
    }
    
    private func actionView(imageName: String, paddingValue: CGFloat = 8, backgroundColor: Color = .spotifyBlack.opacity(0.001), action: (() -> Void)? = nil) -> some View {
        Image(systemName: imageName)
            .padding(paddingValue)
            .asButton {
                action?()
            }
    }
    
    private var makeForYouSection: some View {
        HStack(spacing: 8) {
            Image(systemName: "applelogo")
                .font(.title3)
                .foregroundStyle(.spotifyGreen)
            
            Text("Made for")
            Text(userName)
                .bold()
                .foregroundStyle(.spotifyWhite)
        }

    }
    
    private var actionsRow: some View {
        HStack(spacing: 0) {
            HStack(spacing: 0) {
                actionView(imageName: "plus.circle")
                actionView(imageName: "arrow.down.circle")
                actionView(imageName: "square.and.arrow.up")
                actionView(imageName: "ellipsis")
            }
            .offset(x: -8)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack(spacing: 0) {
                actionView(imageName: "shuffle")
                    .font(.system(size: 24))
                actionView(imageName: "play.circle.fill")
                    .font(.system(size: 24))
            }
            .foregroundStyle(.spotifyGreen)
        }
        .font(.title2)
    }
}

#Preview {
    ZStack {
        Color.spotifyBlack.ignoresSafeArea()
        
        SpotifyPlaylistDescription()
    }
}
