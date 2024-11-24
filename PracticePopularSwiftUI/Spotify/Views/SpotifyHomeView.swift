//
//  SpotifyHomeView.swift
//  PracticePopularSwiftUI
//
//  Created by G Zhen on 11/24/24.
//

import SwiftUI

struct SpotifyHomeView: View {
    @State private var currentUser: User?
    
    var body: some View {
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()
            
            HStack {
                if currentUser != nil {
                    ImageLoaderView()
                        .frame(width: 30, height: 30)
                        .background(.spotifyWhite)
                        .clipShape(Circle())
                        .onTapGesture {
                            
                        }
                }
                ScrollView(.horizontal) {
                    HStack(spacing: 8) {
                        ForEach(0..<20) { _ in
                            RoundedRectangle(cornerRadius: 4)
                                .fill(Color.spotifyWhite)
                                .frame(width: 20, height: 20)
                        }
                    }
                }
                .scrollIndicators(.hidden)
            }
        }
        .task {
            await fetchUser()
        }
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
