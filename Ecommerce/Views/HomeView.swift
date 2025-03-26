//
//  HomeView.swift
//  Ecommerce
//
//  Created by Mac on 25/03/2025.
//

import SwiftUI

struct HomeView: View {
    
    @State var viewModel = HomeViewModel()
    @Environment(CartManager.self) var cartManager: CartManager
    @Environment(TabManager.self) var tabManager: TabManager
    
    fileprivate var NavigationBarView: some View{
        HStack{
            Spacer()
            Text("Ecommerce App")
                .font(.system(size: 16, weight: .semibold))
            Spacer()
        }
        .overlay(alignment: .trailing) {
            Button(action: {
                tabManager.selectedTab = 2
            }, label: {
                ZStack{
                    Image(systemName: "cart.fill")
                        .foregroundColor(.black)
                    if cartManager.productsInCart.count > 0 {
                        ZStack{
                            Circle()
                            Text("\(cartManager.displayTotalCartQuantity)")
                                .foregroundStyle(.white)
                                .font(.system(size: 14))
                        }
                        .offset(CGSize(width: 10, height: -10))
                    }
                }
               
            })
            .padding(.trailing)
        }
    }
    
    var body: some View {
        NavigationStack  {
            ScrollView {
                VStack{
                    NavigationBarView
                    Image("banner")
                        .bannerImageStyle()
                    HStack{
                        Text("Featured")
                            .font(.system(size: 15, weight: .semibold))
                            .padding(.leading)
                        Spacer()
                        
                        NavigationLink {
                            ProductGridView(filter: .isFeatured)
                        }label: {
                            Text("View All")
                                .font(.system(size: 15,weight: .bold))
                            .padding(.trailing)
                        }
                    }
                    .padding(.top)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(viewModel.fetchProducts(filter: .isFeatured)) { product in
                                ProductRow(product: product)
                            }
                        }
                    }
                    .padding(.leading, 5)
                    HStack{
                        Text("Highly Rated")
                            .font(.system(size: 15, weight: .semibold))
                            .padding(.leading)
                        Spacer()
                        NavigationLink {
                            ProductGridView(filter: .highlyRated)
                        }label: {
                            Text("View All")
                                .font(.system(size: 15,weight: .bold))
                            .padding(.trailing)
                        }
                    }
                    .padding(.top)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(viewModel.fetchProducts(filter: .highlyRated)) { product in
                                ProductRow(product: product)
                            }
                        }
                    }
                    .padding(.leading, 5)
                    Button(action: {
                        viewModel.showAllProduct = true
                    }, label: {
                        Text("See Full Catalog")
                         
                    })
                    .buttonStyle(PrimaryButtonStyle())
                    .padding(.horizontal)
                    .padding(.top,15)
                    Spacer()
                }
            }
            .navigationDestination(isPresented: $viewModel.showAllProduct){
                ProductGridView(filter: .all)
            }
        }
    }
}

#Preview {
    HomeView()
        .environment(CartManager())
        .environment(TabManager())
}
