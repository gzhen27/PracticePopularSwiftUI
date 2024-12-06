//
//  BumbleHeartView.swift
//  PracticePopularSwiftUI
//
//  Created by G Zhen on 12/6/24.
//

import SwiftUI

struct BumbleHeartView: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(.bumbleYellow)
                .frame(width: 40, height: 40)
            Image(systemName: "bubble.fill")
                .foregroundColor(.bumbleBlack)
                .font(.system(size: 22))
                .offset(y: 2)
            Image(systemName: "heart.fill")
                .foregroundStyle(.bumbleYellow)
                .font(.system(size: 10))
        }
    }
}

#Preview {
    BumbleHeartView()
}
