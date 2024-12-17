//
//  NetflixMovieDetailView.swift
//  PracticePopularSwiftUI
//
//  Created by G Zhen on 12/14/24.
//

import SwiftUI

struct NetflixMovieDetailView: View {
    var product: Product = .mock
    
    @State private var progress: Double = 0.7
    @State private var isMyList: Bool = false
    @State private var products: [Product] = []
    
    var body: some View {
        ZStack {
            Color.netflixBlack.ignoresSafeArea()
            Color.netflixDarkGray.opacity(0.3).ignoresSafeArea()
            
            VStack(spacing: 0) {
                NetflixDetailsHeaderView(
                    progress: $progress,
                    imageName: product.heroImage) {
                        
                    } onXMarkPressed: {
                        
                    }
                ScrollView {
                    VStack(alignment: .leading, spacing: 6) {
                        detailProductSection
                        buttonsSection
                        productsGridSection
                    }
                    .padding(8)
                }
                .scrollIndicators(.hidden)
                .foregroundStyle(.netflixWhite)
            }
        }
        .task {
            await fetch()
        }
    }
    
    private func fetch() async {
        guard products.isEmpty else { return }
        
        do {
            products = try await DataCenter.getProducts()
        } catch {
            
        }
    }
    
    private var detailProductSection: some View {
        NetflixDetailsProductView(
            title: product.title,
            isNew: true,
            yearReleased: "2024",
            seasonCount: 7,
            hasClosedCaptions: true,
            topTen: 7,
            descriptionText: product.description,
            castText: "Cast: G, G-vx, G-EX",
            onPlayPress: {
                
            },
            onDownloadPress: {
                
            }
        )
    }
    
    private var buttonsSection: some View {
        HStack(spacing: 32) {
            NetflixMyListButton(isMyList: isMyList) {
                isMyList.toggle()
            }
            
            NetflixRateButton { selection in
                
            }
            
            NetflixShareButton()
        }
        .padding(.leading, 32)
    }
    
    private var productsGridSection: some View {
        VStack(alignment: .leading) {
            Text("More Like This")
                .font(.headline)
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 8), count: 3), alignment: .center, spacing: 8, pinnedViews: []) {
                ForEach(products) { product in
                    NetflixMovieCardView(
                        imageName: product.heroImage,
                        title: product.title,
                        isRecentlyAdded: false,
                        topTenRanking: nil
                    )
                }
            }
        }
    }
}

#Preview {
    NetflixMovieDetailView()
}
