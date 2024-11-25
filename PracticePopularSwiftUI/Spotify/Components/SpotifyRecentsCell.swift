//
//  SpotifyRecentsCell.swift
//  PracticePopularSwiftUI
//
//  Created by G Zhen on 11/24/24.
//

import SwiftUI

struct SpotifyRecentsCell: View {
    var imageName = Constants.staticImage
    var title: String = "Recent title content"
    
    var body: some View {
        HStack {
            ImageLoaderView(imageName: imageName)
                .frame(width: 55, height: 55)
            
            Text(title)
                .font(.callout)
                .fontWeight(.semibold)
                .lineLimit(2)
        }
        .padding(.trailing, 6)
        .frame(maxWidth: .infinity, alignment: .leading)
        .themeColor()
        .clipShape(RoundedRectangle(cornerRadius: 6))
    }
}

#Preview {
    ZStack {
        Color.spotifyBlack.ignoresSafeArea()
        VStack {
            HStack {
                SpotifyRecentsCell()
                SpotifyRecentsCell()
            }
            HStack {
                SpotifyRecentsCell()
                SpotifyRecentsCell()
            }
        }
    }
}
