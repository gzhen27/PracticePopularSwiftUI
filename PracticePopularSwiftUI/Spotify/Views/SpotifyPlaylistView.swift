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
    @State private var showNavBar = true
    
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
                    .readingFrame { frame in
                        showNavBar = frame.maxY < 150
                    }
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
            
            navBar
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
        
    private var navBar: some View {
        ZStack {
            Text(product.title)
                .font(.headline)
                .padding(.vertical, 20)
                .frame(maxWidth: .infinity)
                .background(.spotifyBlack)
                .offset(y: showNavBar ? 0 : -40)
                .opacity(showNavBar ? 1 : 0)
            
            Image(systemName: "chevron.left")
                .font(.title3)
                .padding(10)
                .background(showNavBar ? .spotifyGray.opacity(0.001) : .spotifyGray.opacity(0.7))
                .clipShape(Circle())
                .padding(.leading, 16)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .foregroundStyle(.spotifyWhite)
        .animation(.smooth(duration: 0.25), value: showNavBar)
        .frame(maxHeight: .infinity, alignment: .top)
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
