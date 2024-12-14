//
//  NetflixDetailsHeaderView.swift
//  PracticePopularSwiftUI
//
//  Created by G Zhen on 12/14/24.
//

import SwiftUI
import SwiftfulUI

struct NetflixDetailsHeaderView: View {
    @Binding var progress: Double
    
    var imageName: String = Constants.staticImage
    var onAiriplayPressed: (() -> Void)?
    var onXMarkPressed: (() -> Void)?
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ImageLoaderView(imageName: imageName)
                .frame(width: .infinity)
            
            VStack {
                HStack {
                    Circle()
                        .fill(.netflixDarkGray)
                        .overlay {
                            Image(systemName: "tv.badge.wifi")
                                .offset(y: 1)
                        }
                        .frame(width: 36, height: 36)
                        .asButton(.press) {
                            onAiriplayPressed?()
                        }
                    
                    Circle()
                        .fill(.netflixDarkGray)
                        .overlay {
                            Image(systemName: "xmark")
                                .offset(y: 1)
                        }
                        .frame(width: 36, height: 36)
                        .asButton(.press) {
                            onXMarkPressed?()
                        }
                }
                .padding(8)
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundStyle(.netflixWhite)
                .frame(maxWidth: .infinity, alignment: .trailing)
                
                Spacer()
                
                CustomProgressBar(
                    selection: progress,
                    range: 0...1,
                    backgroundColor: .netflixLightGray,
                    foregroundColor: .netflixRed,
                    cornerRadius: 2,
                    height: 4
                )
                .padding(.bottom, 4)
                .animation(.linear, value: progress)
            }
        }
        .aspectRatio(16/9, contentMode: .fit)
    }
    
}

#Preview {
    ZStack {
        Color.netflixBlack.ignoresSafeArea()
        VStack {
            NetflixDetailsHeaderView(progress: .constant(0.7))
            Spacer()
        }
    }
}
