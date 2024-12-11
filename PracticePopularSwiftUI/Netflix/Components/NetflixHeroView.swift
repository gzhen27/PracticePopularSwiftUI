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
        ZStack {
            ImageLoaderView(imageName: imageName)
            VStack(spacing: 16) {
                Spacer()
                
                if isNetflixFilm {
                    HStack(spacing: 4) {
                        Text("N")
                            .foregroundStyle(.netflixRed)
                            .font(.title)
                            .fontWeight(.heavy)
                        Text("FILM")
                            .foregroundStyle(.netflixLightGray)
                    }
                    .offset(y: 12)
                }

                Text(title)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
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
                
                HStack {
                    HStack {
                        Image(systemName: "play.fill")
                        Text("Play")
                    }
                    .padding(.vertical, 4)
                    .frame(width: 120)
                    .foregroundStyle(.netflixDarkGray)
                    .background(.netflixWhite)
                    .clipShape(RoundedRectangle(cornerRadius: 4))
                    .onTapGesture {
                        onPlayPressed?()
                        print("onPlayPressed")
                    }
                    
                    HStack {
                        Image(systemName: "plus")
                        Text("My List")
                    }
                    .padding(.vertical, 4)
                    .frame(width: 120)
                    .foregroundStyle(.netflixWhite)
                    .background(.netflixDarkGray)
                    .clipShape(RoundedRectangle(cornerRadius: 4))
                    .onTapGesture {
                        onMylistPressed?()
                        print("onMylistPressed")
                    }
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .foregroundStyle(.netflixWhite)
            .background(.black.opacity(0.4))
        }
        .aspectRatio(0.8, contentMode: .fit)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .onTapGesture {
            onBackgroundPressed?()
            print("onBackgroundPressed")
        }
    }
}

#Preview {
    NetflixHeroView()
        .padding(48)
}
