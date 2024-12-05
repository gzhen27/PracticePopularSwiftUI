//
//  BumbleHomeView.swift
//  PracticePopularSwiftUI
//
//  Created by G Zhen on 12/5/24.
//

import SwiftUI

struct BumbleHomeView: View {
    var body: some View {
        ZStack {
            Color.bumbleWhite.ignoresSafeArea()
            
            VStack {
                header
                Spacer()
            }
            .padding(8)
        }
    }
    
    private var header: some View {
        HStack(spacing: 0) {
            HStack(spacing: 0) {
                Image(systemName: "line.horizontal.3")
                    .padding(8)
                    .background(.bumbleBlack.opacity(0.001))
                    .asButton {
                        
                    }
                
                Image(systemName: "arrow.uturn.left")
                    .padding(8)
                    .background(.bumbleBlack.opacity(0.001))
                    .asButton {
                        
                    }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            Text("bumble")
                .font(.title)
                .foregroundStyle(.bumbleYellow)
                .frame(maxWidth: .infinity, alignment: .center)
            Image(systemName: "slider.horizontal.3")
                .padding(8)
                .background(.bumbleBlack.opacity(0.001))
                .asButton {
                    
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .font(.title3)
        .fontWeight(.medium)
        .foregroundStyle(.bumbleBlack)
    }
}

#Preview {
    BumbleHomeView()
}
