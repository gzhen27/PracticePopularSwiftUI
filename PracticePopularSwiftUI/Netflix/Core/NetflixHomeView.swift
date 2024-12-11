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
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.netflixBlack.ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 8) {
                    Rectangle()
                        .opacity(0)
                        .frame(height: fullHeaderSize.height)
                    
                    if let heroProduct {
                        NetflixHeroView(
                            imageName: heroProduct.heroImage,
                            isNetflixFilm: true,
                            title: heroProduct.title,
                            categories: [heroProduct.brand ?? "", heroProduct.title],
                            onBackgroundPressed: {
                                
                            },
                            onPlayPressed: {
                                
                            },
                            onMylistPressed: {
                                
                            }
                        )
                        .padding(24)
                    }
                    
                    ForEach(0..<10) { _ in
                        RoundedRectangle(cornerRadius: 8)
                            .fill(.purple.opacity(0.4))
                            .frame(height: 200)
                    }
                }
            }
            
            VStack {
                header
                    .padding(.horizontal, 16)
                
                NetflixCategoryBarView(
                    categories: categories,
                    selectedCategory: selectedCategory) {
                        selectedCategory = nil
                    } onCategoryPressed: { newCategory in
                        selectedCategory = newCategory
                    }
                    .padding(.top, 2)
            }
            .background(.netflixBlack.opacity(0.9))
            .readingFrame { frame in
                fullHeaderSize = frame.size
            }
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
}

#Preview {
    NetflixHomeView()
}
