//
//  ContentView.swift
//  PracticePopularSwiftUI
//
//  Created by G Zhen on 11/23/24.
//

import SwiftUI

struct ContentView: View {
    @State private var users: [User] = []
    @State private var products: [Product] = []
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(products) { product in
                    Text(product.title)
                }
            }
        }
        .padding()
        .task {
            await fetch()
        }
    }
    
    private func fetch() async {
        do {
            users = try await DataCenter.getUsers()
            products = try await DataCenter.getProducts()
        } catch {
            
        }
    }
}

#Preview {
    ContentView()
}
