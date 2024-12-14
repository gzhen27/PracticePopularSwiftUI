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
            }
            .frame(maxHeight: .infinity, alignment: .top)
        }
    }
}

#Preview {
    NetflixMovieDetailView()
}
