//
//  NetflixHomeView.swift
//  PracticePopularSwiftUI
//
//  Created by G Zhen on 12/10/24.
//

import SwiftUI

struct NetflixHomeView: View {
    var body: some View {
        ZStack {
            Color.netflixBlack.ignoresSafeArea()
            
            VStack {
                header
            }
        }
        .foregroundStyle(.netflixWhite)
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
