//
//  Product.swift
//  PracticePopularSwiftUI
//
//  Created by G Zhen on 11/23/24.
//

import Foundation

struct Products: Codable {
    let products: [Product]
    let total, skip, limit: Int
}

struct Product: Codable, Identifiable {
    let id: Int
    let title, description: String
    let price, discountPercentage, rating: Double
    let stock: Int
    let tags: [String]
    let brand: String?
    let sku: String
    let weight: Int
    let warrantyInformation, shippingInformation: String
    let minimumOrderQuantity: Int
    let images: [String]
    let thumbnail: String
    
    var heroImage: String { images.first ?? Constants.staticImage }
    
    var recentlyAdded: Bool {
        Int.random(in: 1...4) == 1
    }
    
    static var mock: Product {
        Product(
            id: 123,
            title: "Mock product title",
            description: "Mock product description",
            price: 999,
            discountPercentage: 15,
            rating: 4.9,
            stock: 50,
            tags: ["item"],
            brand: "Brand",
            sku: "sku",
            weight: 12,
            warrantyInformation: "warrantyInformation",
            shippingInformation: "warrantyInformation",
            minimumOrderQuantity: 12,
            images: [Constants.staticImage, Constants.staticImage, Constants.staticImage],
            thumbnail: Constants.staticImage
        )
    }
    
}

struct ProductRow: Identifiable {
    let id = UUID().uuidString
    let title: String
    let products: [Product]
}
