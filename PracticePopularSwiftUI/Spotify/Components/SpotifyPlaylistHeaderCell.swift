//
//  SpotifyPlaylistHeaderCell.swift
//  PracticePopularSwiftUI
//
//  Created by G Zhen on 11/26/24.
//

import SwiftUI

struct SpotifyPlaylistHeaderCell: View {
    var title: String = "Some playlist title"
    var subtitle: String = "Some playlist subtitle"
    var imageName: String = Constants.staticImage
    var shadowColor: Color = .spotifyBlack.opacity(0.8)
    var height: CGFloat = 300
    
    var body: some View {
        Rectangle()
            .opacity(0)
            .overlay {
                ImageLoaderView(imageName: imageName)
            }
            .overlay (
                VStack(alignment: .leading, spacing: 8) {
                    Text(title)
                        .font(.title)
                    Text(subtitle)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                .foregroundStyle(.spotifyWhite)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    LinearGradient(
                        colors: [
                            shadowColor.opacity(0),
                            shadowColor
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                ,
                alignment: .bottomLeading
            )
            .asStretchyHeader(startingHeight: height)
    }
}

#Preview {
    ZStack {
        Color.spotifyBlack.ignoresSafeArea()
        ScrollView {
            SpotifyPlaylistHeaderCell()
        }
        .ignoresSafeArea()
    }
}
