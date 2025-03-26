//
//  EcommerceApp.swift
//  Ecommerce
//

import SwiftUI

@main
struct EcommerceApp: App {
    
    @State var favoriesManager = FavoriesManager()
    @State var cartManager = CartManager()
    @State var tabManager = TabManager()
    
    var body: some Scene {
        WindowGroup {
            TabView(selection:$tabManager.selectedTab, content: {
                HomeView()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                    .tag(1)
                CartView()
                    .tabItem {
                        Image(systemName: "cart.fill")
                        Text("Cart")
                    }
                    .tag(2)
                FavoriesView()
                    .tabItem {
                        Image(systemName: "heart.fill")
                        Text("Favories")
                    }
                    .tag(3)
            })
            .environment(favoriesManager)
            .environment(cartManager)
            .environment(tabManager)
            .preferredColorScheme(.light)
        }
    }
}
