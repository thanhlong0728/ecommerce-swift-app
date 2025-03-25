//
//  EcommerceApp.swift
//  Ecommerce
//

import SwiftUI

@main
struct EcommerceApp: App {
    var body: some Scene {
        WindowGroup {
            TabView(content: {
                HomeView()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                CartView()
                    .tabItem {
                        Image(systemName: "cart.fill")
                        Text("Cart")
                    }
                FavoriesView()
                    .tabItem {
                        Image(systemName: "heart.fill")
                        Text("Favories")
                    }
            })
            .preferredColorScheme(.light)
        }
    }
}
