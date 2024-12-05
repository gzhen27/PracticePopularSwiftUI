//
//  SpotifyHomeView.swift
//  PracticePopularSwiftUI
//
//  Created by G Zhen on 11/24/24.
//

import SwiftUI
import SwiftfulRouting

struct SpotifyHomeView: View {
    @Environment(\.router) var router
    
    @State private var currentUser: User?
    @State private var products: [Product] = []
    @State private var selectedCategory: Category? = .all
    @State private var productRows: [ProductRow] = []
    @State private var showPlaylistView = false
    
    var body: some View {
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()
            ScrollView {
                LazyVStack(pinnedViews: [.sectionHeaders]) {
                    Section {
                        recentSection
                            .padding(.horizontal, 16)
                        if let product = products.first {
                            newReleaseSection(product: product)
                                .padding(.horizontal, 16)
                        }
                        listRows
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
        .navigationBarHidden(true)
    }

    private func fetch() async {
        guard products.isEmpty else { return }
        
        do {
            currentUser = try await DataCenter.getUsers().first
            products = try await Array(DataCenter.getProducts().prefix(8))
            
            var rows: [ProductRow] = []
            let allBrands = Set(products.map({ $0.brand }))
            for brand in allBrands {
                rows.append(ProductRow(title: brand?.capitalized ?? "", products: products))
            }
            productRows = rows
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
                        .asButton {
                            router.dismissScreen()
                        }
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
                    .asButton {
                        goToPlayListView(product: product)
                    }
            }
        }
    }
    
    private var listRows: some View {
        ForEach(productRows) { row in
            VStack(spacing: 8) {
                Text(row.title)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.spotifyWhite)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 16)
                ScrollView(.horizontal) {
                    HStack(alignment: .top) {
                        ForEach(row.products) { product in
                            SpotifyImageTile(
                                imageName: product.heroImage,
                                imageSize: 120,
                                title: product.title
                            )
                            .asButton {
                                goToPlayListView(product: product)
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                }
                .scrollIndicators(.hidden)
            }
        }
    }
    
    private func goToPlayListView(product: Product) {
        guard let currentUser else { return }
        router.showScreen(.push) { _ in
            SpotifyPlaylistView(product: product, user: currentUser)
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
                goToPlayListView(product: product)
            }
    }
}

#Preview {
    RouterView { _ in
        SpotifyHomeView()
    }
}
