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
        HStack(spacing: 0) {
            ImageLoaderView(imageName: imageName)
                .frame(width: imageSize, height: imageSize)
            VStack(alignment: .leading, spacing: 4) {
                Text(name)
                    .lineLimit(1)
                    .foregroundStyle(.spotifyWhite)
                Text(madeBy)
                    .lineLimit(1)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .frame(height: imageSize, alignment: .top)
            .padding(.horizontal, 8)
            Image(systemName: "ellipsis")
                .padding(8)
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
