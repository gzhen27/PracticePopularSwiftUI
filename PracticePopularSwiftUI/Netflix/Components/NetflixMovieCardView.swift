//
//  NetflixMovieCardView.swift
//  PracticePopularSwiftUI
//
//  Created by G Zhen on 12/12/24.
//

import SwiftUI

struct NetflixMovieCardView: View {
    var width: CGFloat = 90
    var height: CGFloat = 140
    var imageName: String = Constants.staticImage
    var title: String? = "Movie Title"
    var isRecentlyAdded: Bool = false
    var topTenRanking: Int?
    
    var body: some View {
        HStack(alignment: .bottom, spacing: -8) {
            if let topTenRanking {
                Text("\(topTenRanking)")
                    .font(.system(size: 100, weight: .medium, design: .serif))
                    .offset(y: 20)
            }
            
            ZStack(alignment: .bottom) {
                ImageLoaderView(imageName: imageName)
                
                VStack(spacing: 0) {
                    if let title, let firstWord = title.components(separatedBy: " ").first {
                        Text(firstWord)
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .lineLimit(1)
                    }
                    
                    Text("Recently Added")
                        .padding(.horizontal, 4)
                        .padding(.vertical, 2)
                        .frame(maxWidth: .infinity)
                        .background(.netflixRed)
                        .clipShape(RoundedRectangle(cornerRadius: 2))
                        .offset(y: 2)
                        .lineLimit(1)
                        .font(.caption2)
                        .fontWeight(.bold)
                        .minimumScaleFactor(0.1)
                        .padding(.horizontal, 8)
                        .opacity(isRecentlyAdded ? 1 : 0)
                }
                .padding(.top, 6)
                .background(
                    LinearGradient(
                        colors: [.netflixBlack.opacity(0), .netflixBlack.opacity(0.4), .netflixBlack.opacity(0.4)],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
            }
            .clipShape(RoundedRectangle(cornerRadius: 4))
            .frame(width: width, height: height)
        }
        .foregroundStyle(.netflixWhite)
        .background(.purple.opacity(0.2))
    }
}

#Preview {
    ZStack {
        Color.netflixBlack.ignoresSafeArea()
        
        VStack(spacing: 16) {
            NetflixMovieCardView()
            NetflixMovieCardView(isRecentlyAdded: true)
            NetflixMovieCardView(topTenRanking: 7)
            NetflixMovieCardView(isRecentlyAdded: true, topTenRanking: 10)
        }
    }
}
