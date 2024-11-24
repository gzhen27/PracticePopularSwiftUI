//
//  SpotifyHomeView.swift
//  PracticePopularSwiftUI
//
//  Created by G Zhen on 11/24/24.
//

import SwiftUI

struct SpotifyHomeView: View {
    @State private var currentUser: User?
    @State private var selectedCategory: Category? = .all
    
    var body: some View {
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()
            ScrollView {
                LazyVStack(pinnedViews: [.sectionHeaders]) {
                    Section {
                        ForEach(0..<20) { _ in
                            RoundedRectangle(cornerRadius: 16)
                                .frame(width: .infinity, height: 200)
                                .foregroundStyle(.spotifyWhite)
                                .padding(.horizontal)
                                .padding(.vertical, 8)
                        }
                    } header: {
                        header
                    }
                }
                .padding(.top, 8)
            }
            .scrollIndicators(.hidden)
            .clipped()
        }
        .task {
            await fetchUser()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    private var header: some View {
        HStack(spacing: 0) {
            ZStack {
                if currentUser != nil {
                    ImageLoaderView()
                        .background(.spotifyWhite)
                        .clipShape(Circle())
                }
            }
            .frame(width: 35, height: 35)
            ScrollView(.horizontal) {
                HStack(spacing: 8) {
                    ForEach(Category.allCases, id: \.self) { category in
                        SpotifyCategoryCell(
                            title: category.rawValue.capitalized,
                            isSelected: category == selectedCategory
                        )
                        .onTapGesture {
                            selectedCategory = category
                        }
                    }
                }
                .padding(.horizontal, 16)
            }
            .scrollIndicators(.hidden)
        }
        .padding(.vertical, 24)
        .padding(.leading, 8)
        .background(.spotifyBlack)
    }
    
    private func fetchUser() async {
        do {
            currentUser = try await DataCenter.getUsers().first
        } catch {
            
        }
    }
}

#Preview {
    SpotifyHomeView()
}