//
//  ContentView.swift
//  PracticePopularSwiftUI
//
//  Created by G Zhen on 11/23/24.
//

import SwiftUI
import SwiftfulRouting

struct ContentView: View {
    @Environment(\.router) var router
    
    var body: some View {
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()
            
            VStack {
                navigationButton("Spotify UI") {
                    router.showScreen(.fullScreenCover) { _ in
                        SpotifyHomeView()
                    }
                }
                
                navigationButton("Bumble UI") {
                    router.showScreen(.fullScreenCover) { _ in
                        BumbleHomeView()
                    }
                }
                
                navigationButton("Netflix UI") {
                    router.showScreen(.fullScreenCover) { _ in
                        NetflixHomeView()
                    }
                }
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding(.top)
        }
    }
    
    private func navigationButton(_ content: String, action: @escaping () -> Void) -> some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(.spotifyDarkGray)
            .frame(height: 100)
            .padding(.horizontal)
            .overlay {
                Text("\(content)")
                    .font(.largeTitle)
                    .foregroundStyle(.spotifyWhite)
            }
            .asButton {
                action()
            }
    }
}

#Preview {
    RouterView { _ in
        ContentView()
    }
}
