//
//  SpotifyPlaylistView.swift
//  PracticePopularSwiftUI
//
//  Created by G Zhen on 11/26/24.
//

import SwiftUI

import SwiftUI

struct SpotifyPlaylistView: View {
    var product: Product = .mock
    
    var body: some View {
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()
            
            ScrollView() {
                LazyVStack {
                    SpotifyPlaylistHeaderCell(
                        title: product.title,
                        subtitle: product.title,
                        imageName: product.heroImage,
                        height: 250
                    )
                }
            }
        }
    }
}

#Preview {
    SpotifyPlaylistView()
}
