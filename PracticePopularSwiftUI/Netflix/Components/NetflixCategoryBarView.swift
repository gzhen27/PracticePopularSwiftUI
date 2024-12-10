//
//  NetflixCategoryBarView.swift
//  PracticePopularSwiftUI
//
//  Created by G Zhen on 12/10/24.
//

import SwiftUI

struct NetflixCategoryBarView: View {
    var categories: [NetflixCategory] = NetflixCategory.mock
    var selectedCategory: NetflixCategory?
    var onXMarkPressed: (() -> Void)?
    var onCategoryPressed: ((NetflixCategory) -> Void)?
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                if selectedCategory != nil {
                    Image(systemName: "xmark")
                        .padding(8)
                        .background(
                            Circle()
                                .stroke(lineWidth: 1)
                        )
                        .foregroundStyle(.netflixLightGray)
                        .background(.netflixBlack.opacity(0.001))
                        .onTapGesture {
                            onXMarkPressed?()
                        }
                        .offset(x: -4)
                        .transition(AnyTransition.move(edge: .leading))
                        .padding(.leading, 20)
                }
                
                ForEach(categories, id: \.self) { category in
                    if selectedCategory == nil || selectedCategory == category {
                        NetflixCategoryView(
                            title: category.title,
                            hasDropdown: category.hasDrowdown,
                            isSelected: selectedCategory == category
                        )
                        .background(.netflixBlack.opacity(0.001))
                        .onTapGesture {
                            onCategoryPressed?(category)
                        }
                        .padding(.leading, ((selectedCategory == nil) && (category == categories.first) ? 16 : 0))
                    }
                }
            }
            .padding(4)
        }
        .scrollIndicators(.hidden)
        .animation(.bouncy, value: selectedCategory)
    }
}

fileprivate struct NetflixCategoryBarViewPreview: View {
    @State private var categories: [NetflixCategory] = NetflixCategory.mock
    @State private var selectedCategory: NetflixCategory?
    
    var body: some View {
        NetflixCategoryBarView(
            categories: categories,
            selectedCategory: selectedCategory) {
                selectedCategory = nil
            } onCategoryPressed: { newCategory in
                selectedCategory = newCategory
            }

    }
}

#Preview {
    ZStack {
        Color.netflixBlack.ignoresSafeArea()
        
        NetflixCategoryBarViewPreview()
    }
}
