//
//  NetflixHomeView.swift
//  PracticePopularSwiftUI
//
//  Created by G Zhen on 12/10/24.
//

import SwiftUI
import SwiftfulUI

struct NetflixHomeView: View {
    @State private var categories: [NetflixCategory] = NetflixCategory.mock
    @State private var selectedCategory: NetflixCategory?
    @State private var fullHeaderSize: CGSize = .zero
    @State private var heroProduct: Product?
    @State private var currentUser: User?
    @State private var productRows: [ProductRow] = []
    @State private var scrollViewOffset: CGFloat = 0
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.netflixBlack.ignoresSafeArea()
            
            backgroundGradientLayer
            
            productsSection
            
            navBar
        }
        .foregroundStyle(.netflixWhite)
        .task {
            await fetch()
        }
    }
    
    private func fetch() async {
        guard productRows.isEmpty else { return }
        
        do {
            currentUser = try await DataCenter.getUsers().first
            let products = try await DataCenter.getProducts()
            heroProduct = products.first
            
            var rows: [ProductRow] = []
            let allBrands = Set(products.map({ $0.brand }))
            for brand in allBrands {
                rows.append(ProductRow(title: brand?.capitalized ?? "", products: products))
            }
            productRows = rows
        } catch {
            
        }
    }
    
    private var navBar: some View {
        VStack {
            header
                .padding(.horizontal, 16)
            
            if scrollViewOffset > -20 {
                NetflixCategoryBarView(
                    categories: categories,
                    selectedCategory: selectedCategory) {
                        selectedCategory = nil
                    } onCategoryPressed: { newCategory in
                        selectedCategory = newCategory
                    }
                    .padding(.top, 2)
                    .transition(.move(edge: .top).combined(with: .opacity))
            }
        }
        .padding(.bottom, 8)
        .background(
            ZStack {
                if scrollViewOffset < -70 {
                    Rectangle()
                        .fill(.clear)
                        .background(.ultraThinMaterial)
                        .brightness(-0.4)
                        .ignoresSafeArea()
                }
            }
        )
        .animation(.smooth, value: scrollViewOffset)
        .readingFrame { frame in
            fullHeaderSize = fullHeaderSize == .zero ? frame.size : fullHeaderSize
        }
    }
    
    private var header: some View {
        HStack(spacing: 0) {
            Text("For You")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.title)
            
            HStack(spacing: 16) {
                Image(systemName: "tv.badge.wifi")
                Image(systemName: "magnifyingglass")
            }
            .font(.title2)
        }
    }
    
    private var backgroundGradientLayer: some View {
        ZStack {
            LinearGradient(colors: [.netflixDarkGray.opacity(1), .netflixDarkGray.opacity(0)], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            LinearGradient(colors: [.netflixDarkRed.opacity(0.5), .netflixDarkRed.opacity(0)], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
        }
        .frame(maxHeight: max(scrollViewOffset * 0.75 + 400, 10))
        .opacity(scrollViewOffset < -250 ? 0 : 1)
        .animation(.easeInOut, value: scrollViewOffset)
    }
    
    private func heroImageView(product: Product) -> some View {
        NetflixHeroView(
            imageName: product.heroImage,
            isNetflixFilm: true,
            title: product.title,
            categories: [product.brand ?? "", product.title],
            onBackgroundPressed: {
                
            },
            onPlayPressed: {
                
            },
            onMylistPressed: {
                
            }
        )
        .padding(24)
    }
    
    private var productsSection: some View {
        ScrollViewWithOnScrollChanged(.vertical, showsIndicators: false) {
            VStack(spacing: 8) {
                Rectangle()
                    .opacity(0)
                    .frame(height: 0)
                    .padding(.bottom, fullHeaderSize.height)
                
                if let heroProduct {
                    heroImageView(product: heroProduct)
                }
                
                LazyVStack(spacing: 16) {
                    ForEach(Array(productRows.enumerated()), id: \.offset) { (index, productRow) in
                        productRowSection(productRow: productRow, ranking: index == 1)
                    }
                }
            }
        } onScrollChanged: { offset in
            scrollViewOffset = min(offset.y, 0)
        }
    }
    
    private func productRowSection(productRow: ProductRow, ranking: Bool = false) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(productRow.title)
                .font(.headline)
                .padding(.leading)
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(Array(productRow.products.enumerated()), id: \.offset) { (index, product) in
                        NetflixMovieCardView(
                            imageName: product.heroImage,
                            title: product.title,
                            isRecentlyAdded: index % 2 == 0,
                            topTenRanking: ranking ? index + 1 : nil
                        )
                    }
                }
                .padding(.leading)
            }
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    NetflixHomeView()
}
