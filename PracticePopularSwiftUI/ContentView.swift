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
                RoundedRectangle(cornerRadius: 10)
                    .fill(.spotifyDarkGray)
                    .frame(height: 100)
                    .padding(.horizontal)
                    .overlay {
                        Text("Spotify UI")
                            .font(.largeTitle)
                            .foregroundStyle(.spotifyWhite)
                    }
                    .asButton {
                        router.showScreen(.fullScreenCover) { _ in
                            SpotifyHomeView()
                        }
                    }
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding(.top)
        }
    }
}

#Preview {
    RouterView { _ in
        ContentView()
    }
}
