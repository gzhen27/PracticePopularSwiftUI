//
//  SpotifyImageTile.swift
//  PracticePopularSwiftUI
//
//  Created by G Zhen on 11/26/24.
//

import SwiftUI

struct SpotifyImageTile: View {
    var imageName = Constants.staticImage
    var imageSize: CGFloat = 100
    var title = "product name placeholder"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ImageLoaderView(imageName: imageName)
                .frame(width: imageSize, height: imageSize)
            Text(title)
                .font(.callout)
                .foregroundStyle(.spotifyLightGray)
                .lineLimit(2)
                .padding(4)
        }
        .frame(width: imageSize)
    }
}

#Preview {
    ZStack {
        Color.spotifyBlack.ignoresSafeArea()
        
        SpotifyImageTile()
    }
}
