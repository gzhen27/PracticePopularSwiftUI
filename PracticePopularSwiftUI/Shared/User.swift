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
    
    var work: String = "Working at home"
    var education: String = "Studying at home"
    
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
