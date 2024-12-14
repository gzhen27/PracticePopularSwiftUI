//
//  NetflixDetailsHeaderView.swift
//  PracticePopularSwiftUI
//
//  Created by G Zhen on 12/14/24.
//

import SwiftUI
import SwiftfulUI

struct NetflixDetailsHeaderView: View {
    var imageName: String = Constants.staticImage
    var progress: Double = 1
    var onAiriplayPressed: (() -> Void)?
    var onXMarkPressed: (() -> Void)?
    
    @State private var playerHeight: CGFloat = 0
    
    var body: some View {
        ZStack {
            ImageLoaderView(imageName: imageName)
                .frame(width: .infinity)
            
            VStack {
                HStack {
                   Image(systemName: "tv.badge.wifi")
                        .font(.caption)
                        .fontWeight(.bold)
                        .frame(width: 32, height: 32)
                        .background(.netflixDarkGray)
                        .foregroundStyle(.netflixWhite)
                        .clipShape(Circle())
                        .asButton(.press) {
                            onAiriplayPressed?()
                        }
                    
                    Image(systemName: "xmark")
                         .font(.caption)
                         .fontWeight(.bold)
                         .frame(width: 32, height: 32)
                         .background(.netflixDarkGray)
                         .foregroundStyle(.netflixWhite)
                         .clipShape(Circle())
                         .asButton(.press) {
                             onXMarkPressed?()
                         }
                }
                .padding(8)
                .frame(maxWidth: .infinity, alignment: .trailing)
                
                Spacer()
                
                CustomProgressBar(selection: progress, range: 0...1, foregroundColor: .netflixRed, cornerRadius: 0, height: 4)
                    .padding(.bottom, 4)
            }
            .frame(height: playerHeight)
        }
        .aspectRatio(16/9, contentMode: .fit)
        .readingFrame{ frame in
            playerHeight = frame.height
        }
    }
    
}

#Preview {
    ZStack {
        Color.netflixBlack.ignoresSafeArea()
        VStack {
            NetflixDetailsHeaderView()
            Spacer()
        }
    }
}
