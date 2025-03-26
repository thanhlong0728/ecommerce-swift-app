//
//  EcommerceApp.swift
//  Ecommerce
//

import SwiftUI

@main
struct EcommerceApp: App {
    
    @State var favoriesManager = FavoriesManager()
    @State var cartManager = CartManager()
    
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
            .environment(favoriesManager)
            .environment(cartManager)
            .preferredColorScheme(.light)
        }
    }
}
