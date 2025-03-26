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
                    cartManager.addToCart(product: productInCart.product)
                } onDecrement:{
                    cartManager.removeFromCart(product: productInCart.product)
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
            VStack {
                Divider()
                HStack {
                    Text("Total: \(cartManager.displayTotalCartQuantity) items")
                        .font(.system(size: 16))
                    Spacer()
                    Text(cartManager.displayTotalCartPrice)
                        .font(.system(size: 16, weight: .bold))
                }
                .padding(.horizontal)
                .padding(.vertical,30)
                PaymentButton(action: cartManager.pay)
                    .frame(height: 40)
                    .padding(.horizontal, 30)
                    .padding(.bottom, 25)
            }
        }
    }
}

#Preview {
    CartView()
        .environment(CartManager())
}
