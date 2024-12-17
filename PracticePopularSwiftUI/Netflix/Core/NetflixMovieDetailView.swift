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
                    .padding(8)
                }
                .scrollIndicators(.hidden)
            }
        }
    }
}

#Preview {
    NetflixMovieDetailView()
}
