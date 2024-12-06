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
    
    var work: String { "Working at home" }
    var education: String { "Studying at home" }
    var aboutMe: String { "This is me This is me This is me This is me" }
    
    var basics: [UserInterest] {
        [
            UserInterest(iconName: "ruler", emoji: nil, text: "\(height)"),
            UserInterest(iconName: "graduationcap", emoji: nil, text: education),
            UserInterest(iconName: "wineglass", emoji: nil, text: "Socially"),
            UserInterest(iconName: "moon.starts.fill", emoji: nil, text: "Virgo"),
        ]
    }
    
    var interests: [UserInterest] {
        [
            UserInterest(iconName: nil, emoji: "🐰", text: "Running"),
            UserInterest(iconName: nil, emoji: "🐯", text: "Gaming"),
            UserInterest(iconName: nil, emoji: "🦉", text: "Sleeping"),
            UserInterest(iconName: nil, emoji: "🦅", text: "Flying"),
        ]
    }
    
    static var mock: User {
        User(
            id: 777,
            firstName: "G",
            lastName: "Zhen",
            maidenName: "",
            age: 99,
            email: "",
            phone: "",
            username: "",
            password: "",
            birthDate: "",
            image: Constants.staticImage,
            bloodGroup: "",
            height: 10,
            weight: 10
        )
    }
}
