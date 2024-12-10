//
//  NetflixHomeView.swift
//  PracticePopularSwiftUI
//
//  Created by G Zhen on 12/10/24.
//

import SwiftUI

struct NetflixHomeView: View {
    @State private var categories: [NetflixCategory] = NetflixCategory.mock
    @State private var selectedCategory: NetflixCategory?
    
    var body: some View {
        ZStack {
            Color.netflixBlack.ignoresSafeArea()
            
            VStack {
                header
                    .padding(.horizontal, 16)
                
                NetflixCategoryBarView(
                    categories: categories,
                    selectedCategory: selectedCategory) {
                        selectedCategory = nil
                    } onCategoryPressed: { newCategory in
                        selectedCategory = newCategory
                    }
                    .padding(.top, 2)

                Spacer()
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
