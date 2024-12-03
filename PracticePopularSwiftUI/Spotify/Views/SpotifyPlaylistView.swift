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
    var user: User = .mock
    
    @State private var products: [Product] = []
    
    var body: some View {
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()
            
            ScrollView(.vertical) {
                LazyVStack {
                    SpotifyPlaylistHeaderCell(
                        title: product.title,
                        subtitle: product.title,
                        imageName: product.heroImage,
                        height: 250
                    )
                    VStack {
                        SpotifyPlaylistDescription(
                            descriptionText: product.description,
                            userName: user.firstName,
                            subheadline: product.title
                        )
                        songsSection
                    }
                    .padding(.leading)

                }
            }
        }
        .task {
            await fetchProduct()
        }
    }
    
    private func fetchProduct() async {
        do {
            products = try await DataCenter.getProducts()
        } catch {
            
        }
    }
    
    private var songsSection: some View {
        ForEach(products) { product in
            SpotifySongItem(
                imageName: product.heroImage,
                imageSize: 50,
                name: product.title,
                madeBy: product.description) {
                    
                } moreAction: {
                    
                }
        }
    }
}

#Preview {
    SpotifyPlaylistView()
}
