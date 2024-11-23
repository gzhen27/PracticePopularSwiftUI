//
//  User.swift
//  PracticePopularSwiftUI
//
//  Created by G Zhen on 11/23/24.
//

struct Users: Codable {
    let users: [User]
    let total, skip, limit: Int
}

struct User: Codable, Identifiable {
    let id: Int
    let firstName, lastName, maidenName: String
    let age: Int
    let email, phone, username, password: String
    let birthDate: String
    let image: String
    let bloodGroup: String
    let height, weight: Double
}
