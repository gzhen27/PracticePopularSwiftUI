//
//  NetflixHeroView.swift
//  PracticePopularSwiftUI
//
//  Created by G Zhen on 12/11/24.
//

import SwiftUI

struct NetflixHeroView: View {
    var imageName: String = Constants.staticImage
    var isNetflixFilm: Bool = true
    var title: String = "Player"
    var categories: [String] = ["Romantic", "Comedy", "Mystery"]
    var onBackgroundPressed: (() -> Void)?
    var onPlayPressed: (() -> Void)?
    var onMylistPressed: (() -> Void)?
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ImageLoaderView(imageName: imageName)
            VStack(spacing: 16) {
                if isNetflixFilm {
                    HStack(spacing: 4) {
                        Text("N")
                            .foregroundStyle(.netflixRed)
                            .font(.title)
                            .fontWeight(.heavy)
                        Text("FILM")
                            .kerning(3)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.netflixLightGray)
                    }
                    .offset(y: 12)
                }
                
                Text(title)
                    .font(.system(size: 50, weight: .medium, design: .serif))
                    .lineLimit(1)
                
                HStack {
                    ForEach(categories, id: \.self) { category in
                        Text(category)
                            .font(.callout)
                        if (category != categories.last) {
                            Circle()
                                .frame(width: 4, height: 4)
                        }
                    }
                }
                
                HStack(spacing: 16) {
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
                        onPlayPressed?()
                        print("onPlayPressed")
                    }
                    
                    HStack {
                        Image(systemName: "plus")
                        Text("My List")
                    }
                    .padding(.vertical, 8)
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(.netflixWhite)
                    .background(.netflixDarkGray)
                    .clipShape(RoundedRectangle(cornerRadius: 4))
                    .asButton(.press) {
                        onMylistPressed?()
                        print("onMylistPressed")
                    }
                }
                .font(.callout)
                .fontWeight(.semibold)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .foregroundStyle(.netflixWhite)
            .background(
                LinearGradient(
                    colors:[
                        .netflixBlack.opacity(0),
                        .netflixBlack.opacity(0.4),
                        .netflixBlack.opacity(0.4),
                        .netflixBlack.opacity(0.4),
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
        }
        .aspectRatio(0.8, contentMode: .fit)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .asButton(.tap) {
            onBackgroundPressed?()
            print("onBackgroundPressed")
        }
    }
}

#Preview {
    NetflixHeroView()
        .padding(48)
}
