//
//  SpotifyHomeView.swift
//  PracticePopularSwiftUI
//
//  Created by G Zhen on 11/24/24.
//

import SwiftUI

struct SpotifyHomeView: View {
    @State private var currentUser: User?
    @State private var products: [Product] = []
    @State private var selectedCategory: Category? = .all
    
    var body: some View {
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()
            ScrollView {
                LazyVStack(pinnedViews: [.sectionHeaders]) {
                    Section {
                        recentSection
                        if let product = products.first {
                            newReleaseSection(product: product)

                        }
                        ForEach(0..<20) { _ in
                            RoundedRectangle(cornerRadius: 16)
                                .frame(width: .infinity, height: 200)
                                .foregroundStyle(.spotifyWhite)
                                .padding(.horizontal)
                                .padding(.vertical, 8)
                        }
                        .padding(.top, 32)
                    } header: {
                        header
                    }
                }
                .padding(.top, 8)
            }
            .scrollIndicators(.hidden)
            .clipped()
        }
        .task {
            await fetch()
        }
        .toolbar(.hidden, for: .navigationBar)
    }

    private func fetch() async {
        do {
            currentUser = try await DataCenter.getUsers().first
            products = try await Array(DataCenter.getProducts().prefix(8))
        } catch {
            
        }
    }
    
    private var header: some View {
        HStack(spacing: 0) {
            ZStack {
                if currentUser != nil {
                    ImageLoaderView()
                        .background(.spotifyWhite)
                        .clipShape(Circle())
                }
            }
            .frame(width: 35, height: 35)
            ScrollView(.horizontal) {
                HStack(spacing: 8) {
                    ForEach(Category.allCases, id: \.self) { category in
                        SpotifyCategoryCell(
                            title: category.rawValue.capitalized,
                            isSelected: category == selectedCategory
                        )
                        .onTapGesture {
                            selectedCategory = category
                        }
                    }
                }
                .padding(.horizontal, 16)
            }
            .scrollIndicators(.hidden)
        }
        .padding(.vertical, 24)
        .padding(.leading, 8)
        .background(.spotifyBlack)
    }
    
    private var recentSection: some View {
        LazyVGrid(columns: [GridItem(), GridItem()], alignment: .center, spacing: 10) {
            ForEach(products) { product in
                SpotifyRecentsCell(imageName: product.heroImage, title: product.title)
            }
        }
    }
    
    private func newReleaseSection(product: Product) -> some View {
        SpotifyNewReleaseCell(
            imageName: product.heroImage,
            headline: product.brand,
            subheadline: product.title,
            title: product.title,
            subtitle: product.description) {
                print("pressed the add button")
            } onPlayPressed: {
                print("pressed the play button")
            }
    }
}

#Preview {
    SpotifyHomeView()
}
