//
//  SpotifyNewReleaseCell.swift
//  PracticePopularSwiftUI
//
//  Created by G Zhen on 11/24/24.
//

import SwiftUI

struct SpotifyNewReleaseCell: View {
    var imageName: String = Constants.staticImage
    var headline: String? = "New Release"
    var subheadline: String? = "Discover it"
    var title: String? = "Product title"
    var subtitle: String? = "Product subtitle"
    var onAddToPlaylistPressed: (() -> Void)?
    var onPlayPressed: (() -> Void)?
    
    var body: some View {
        VStack(spacing: 16) {
            HStack(spacing: 8) {
                ImageLoaderView(imageName: imageName)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                VStack(alignment: .leading, spacing: 2) {
                    if let headline {
                        Text(headline)
                            .foregroundStyle(.spotifyLightGray)
                            .font(.callout)
                    }
                    if let subheadline {
                        Text(subheadline)
                            .font(.title)
                            .fontWeight(.medium)
                            .foregroundStyle(.spotifyWhite)
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack {
                ImageLoaderView(imageName: imageName)
                    .frame(width: 140, height: 140)
                
                VStack(alignment: .leading, spacing: 32) {
                    VStack(alignment: .leading, spacing: 2) {
                        if let title {
                            Text(title)
                                .fontWeight(.semibold)
                                .foregroundStyle(.spotifyWhite)
                        }
                        if let subtitle {
                            Text(subtitle)
                                .foregroundStyle(.spotifyLightGray)
                        }
                    }
                    .font(.callout)
                    
                    HStack {
                        Image(systemName: "plus.circle")
                            .foregroundStyle(.spotifyLightGray)
                            .font(.title3)
                            .padding(4)
                            .background(.black.opacity(0.001))
                            .onTapGesture {
                                onAddToPlaylistPressed?()
                            }
                            .offset(x: -4)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Image(systemName: "play.circle.fill")
                            .foregroundStyle(.spotifyWhite)
                            .font(.title)
                    }
                }
                .padding(.trailing)
            }
            .themeColor()
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .onTapGesture {
                onPlayPressed?()
            }
        }
    }
}

#Preview {
    ZStack {
        Color.spotifyBlack.ignoresSafeArea()
        SpotifyNewReleaseCell()
            .padding()
    }
}
