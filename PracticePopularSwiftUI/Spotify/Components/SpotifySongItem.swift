//
//  SpotifySongItem.swift
//  PracticePopularSwiftUI
//
//  Created by G Zhen on 11/27/24.
//

import SwiftUI

struct SpotifySongItem: View {
    var imageName: String = Constants.staticImage
    var imageSize: CGFloat = 50
    var name: String = "product name"
    var madeBy: String = "made by"
    var mainAction: (() -> Void)? = nil
    var moreAction: (() -> Void)? = nil
    
    var body: some View {
        HStack(spacing: 8) {
            ImageLoaderView(imageName: imageName)
                .frame(width: imageSize, height: imageSize)
            VStack(alignment: .leading, spacing: 4) {
                Text(name)
                    .lineLimit(1)
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundStyle(.spotifyWhite)
                Text(madeBy)
                    .lineLimit(1)
                    .font(.callout)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .frame(height: imageSize, alignment: .top)
            Image(systemName: "ellipsis")
                .font(.subheadline)
                .padding(16)
                .background(Color.spotifyBlack.opacity(00.001))
                .asButton {
                    moreAction?()
                }
        }
        .frame(maxWidth: .infinity)
        .foregroundStyle(.spotifyLightGray)
        .asButton {
            mainAction?()
        }
    }
}

#Preview {
    ZStack {
        Color.spotifyBlack.ignoresSafeArea()
        LazyVStack(spacing: 8) {
            SpotifySongItem()
            SpotifySongItem()
            SpotifySongItem()
            SpotifySongItem()
            SpotifySongItem()
        }
    }
}
