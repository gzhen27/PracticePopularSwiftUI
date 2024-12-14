//
//  NetflixMovieDetailView.swift
//  PracticePopularSwiftUI
//
//  Created by G Zhen on 12/14/24.
//

import SwiftUI

struct NetflixMovieDetailView: View {
    var product: Product = .mock
    
    var body: some View {
        ZStack {
            Color.netflixBlack.ignoresSafeArea()
            Color.netflixDarkGray.opacity(0.3).ignoresSafeArea()
            
            VStack(spacing: 0) {
                NetflixDetailsHeaderView(
                    progress: 0.7) {
                        
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
