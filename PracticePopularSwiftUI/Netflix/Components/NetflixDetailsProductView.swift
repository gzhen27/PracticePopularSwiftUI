//
//  NetflixDetailsProductView.swift
//  PracticePopularSwiftUI
//
//  Created by G Zhen on 12/14/24.
//

import SwiftUI

struct NetflixDetailsProductView: View {
    var title: String = "Movie Title"
    var isNew: Bool = true
    var yearReleased: String? = "2024"
    var seasonCount: Int? = 2
    var hasClosedCaptions: Bool = true
    var topTen: Int? = 6
    var descriptionText: String? = "This is the description for the movie"
    var castText: String? = "Cast: G, G VX, Just one Guy"
    var onPlayPress: (() -> Void)?
    var onDownloadPress: (() -> Void)?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack(spacing: 8) {
                if isNew {
                    Text("New")
                        .foregroundStyle(.green)
                }
                
                if let yearReleased {
                    Text(yearReleased)
                }
                
                if let seasonCount {
                    Text("\(seasonCount) Seasons")
                }
                
                if hasClosedCaptions {
                    Image(systemName: "captions.bubble")
                }
            }
            .foregroundStyle(.netflixLightGray)
            
            if let topTen {
                HStack(spacing: 8) {
                    topTenIcon
                    
                    Text("#\(topTen) in TV Shows Today")
                        .font(.headline)
                }
            }
            
            VStack(spacing: 8) {
                HStack {
                    Image(systemName: "play.fill")
                    Text("Play")
                }
                .padding(.vertical, 8)
                .frame(maxWidth: .infinity)
                .foregroundStyle(.netflixDarkGray)
                .background(.netflixWhite)
                .clipShape(RoundedRectangle(cornerRadius: 4))
                .asButton(.press) {
                    onPlayPress?()
                }
                
                HStack {
                    Image(systemName: "arrow.down.to.line.alt")
                    Text("Download")
                }
                .padding(.vertical, 8)
                .frame(maxWidth: .infinity)
                .foregroundStyle(.netflixWhite)
                .background(.netflixDarkGray)
                .clipShape(RoundedRectangle(cornerRadius: 4))
                .asButton(.press) {
                    onDownloadPress?()
                }
            }
            .font(.callout)
            .fontWeight(.semibold)
            
            Group {
                if let descriptionText {
                    Text(descriptionText)
                }
                
                if let castText {
                    Text(castText)
                        .foregroundStyle(.netflixLightGray)
                }
            }
        }
        .foregroundStyle(.netflixWhite)
    }
    
    private var topTenIcon: some View {
        Rectangle()
            .fill(.netflixRed)
            .frame(width: 28, height: 28)
            .overlay {
                VStack(spacing: -4) {
                    Text("TOP")
                        .font(.system(size: 8))
                    Text("10")
                        .font(.system(size: 16))
                        .offset(x: -0.5)
                }
                .fontWeight(.bold)
                .offset(y: 1)
            }
    }
}

#Preview {
    ZStack {
        Color.netflixBlack.ignoresSafeArea()
        VStack(spacing: 40) {
            NetflixDetailsProductView()
            NetflixDetailsProductView(
                isNew: false,
                yearReleased: nil,
                seasonCount: nil,
                hasClosedCaptions: false,
                topTen: nil,
                descriptionText: nil,
                castText: nil
            )
        }
    }
}
