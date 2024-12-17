//
//  NetflixMyListButton.swift
//  PracticePopularSwiftUI
//
//  Created by G Zhen on 12/17/24.
//

import SwiftUI

struct NetflixMyListButton: View {
    var isMyList: Bool = false
    var onButtonPressed: (() -> Void)?
    
    var body: some View {
        VStack(spacing: 8) {
            ZStack {
                Image(systemName: "checkmark")
                    .opacity(isMyList ? 1 : 0)
                    .rotationEffect(Angle(degrees: isMyList ? 0 : 180))
                Image(systemName: "plus")
                    .opacity(isMyList ? 0 : 1)
                    .rotationEffect(Angle(degrees: isMyList ? -180 : 0))
            }
            .font(.title)
            
            Text("My List")
                .font(.caption)
                .foregroundStyle(.netflixLightGray)
        }
        .foregroundStyle(.netflixWhite)
        .padding(8)
        .background(.netflixBlack.opacity(0.001))
        .animation(.bouncy, value: isMyList)
        .onTapGesture {
            onButtonPressed?()
        }
    }
}

fileprivate struct MyListButtonPreview: View {
    @State private var isMyList: Bool = false
    
    var body: some View {
        NetflixMyListButton(isMyList: isMyList) {
            isMyList.toggle()
        }
    }
}

#Preview {
    ZStack {
        Color.netflixBlack.ignoresSafeArea()
        
        MyListButtonPreview()
    }
}
