//
//  CartView.swift
//  Ecommerce
//
//  Created by Mac on 25/03/2025.
//

import SwiftUI

struct CartView: View {
    
    @Environment(CartManager.self) var cartManager: CartManager
    
    fileprivate func CartRow(productInCart: ProductInCart) -> some View {
        HStack {
            Image(productInCart.product.image)
                .squareImageStyle()
            VStack(alignment: .leading) {
                Text(productInCart.product.title)
                    .font(.system(size: 15))
                    .padding(.bottom,1)
                Text(productInCart.product.displayPrice)
                    .font(.system(size: 15))
                Stepper("Quantity \(productInCart.quantity)"){
                    
                } onDecrement:{
                    
                }
            }
        }
    }
    
    var body: some View {
        VStack{
            List {
                ForEach(cartManager.productsInCart) { productInCart in
                    CartRow(productInCart: productInCart)
                }
            }
        }
    }
}

#Preview {
    CartView()
        .environment(CartManager())
}
