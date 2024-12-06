//
//  BumblePillGridView.swift
//  PracticePopularSwiftUI
//
//  Created by G Zhen on 12/6/24.
//

import SwiftUI
import SwiftfulUI

struct UserInterest: Identifiable {
    let id = UUID().uuidString
    var iconName: String?
    var emoji: String?
    var text: String
}

struct BumblePillGridView: View {
    var interests: [UserInterest] = User.mock.interests
    
    var body: some View {
        ZStack {
            NonLazyVGrid(columns: 2, alignment: .leading, spacing: 8, items: interests) { interest in
                if let interest {
                    BumblePillView(
                        iconName: interest.iconName,
                        emoji: interest.emoji,
                        text: interest.text
                    )
                }
            }
        }
    }
}

#Preview {
    VStack(spacing: 40) {
        BumblePillGridView(interests: User.mock.basics)
        BumblePillGridView(interests: User.mock.interests)
    }
}
