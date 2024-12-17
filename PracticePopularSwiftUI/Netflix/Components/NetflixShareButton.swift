//
//  NetflixShareButton.swift
//  PracticePopularSwiftUI
//
//  Created by G Zhen on 12/17/24.
//

import SwiftUI

struct NetflixShareButton: View {
    var url: String = "https://www.apple.com"
    
    var body: some View {
        if let url = URL(string: url) {
            ShareLink(item: url) {
                VStack(spacing: 8) {
                    Image(systemName: "square.and.arrow.up")
                        .font(.title)
                    
                    Text("Share")
                        .font(.caption)
                        .foregroundStyle(.netflixLightGray)
                }
                .foregroundStyle(.netflixWhite)
                .padding(6)
                .background(.netflixBlack.opacity(0.001))
            }
        }
    }
}

#Preview {
    ZStack {
        Color.netflixBlack.ignoresSafeArea()
        NetflixShareButton()
    }
}
