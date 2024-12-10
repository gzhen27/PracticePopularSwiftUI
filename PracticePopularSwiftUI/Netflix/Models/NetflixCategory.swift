//
//  NetflixCategory.swift
//  PracticePopularSwiftUI
//
//  Created by G Zhen on 12/10/24.
//

struct NetflixCategory: Hashable, Equatable {
    let title: String
    let hasDrowdown: Bool
    
    static var mock: [NetflixCategory] {
        [
            .init(title: "TV Shows", hasDrowdown: false),
            .init(title: "Movies", hasDrowdown: false),
            .init(title: "Categories", hasDrowdown: true)
        ]
    }
}
