//
//  DataCenter.swift
//  PracticePopularSwiftUI
//
//  Created by G Zhen on 11/23/24.
//
import Foundation

struct DataCenter {
    
    static func getUsers() async throws -> [User] {
        guard let url = URL(string: "https://dummyjson.com/users") else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let users = try JSONDecoder().decode(Users.self, from: data)
        
        return users.users
    }
    
    static func getProducts() async throws -> [Product] {
        guard let url = URL(string: "https://dummyjson.com/products") else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let products = try JSONDecoder().decode(Products.self, from: data)
        
        return products.products
    }
    
}

