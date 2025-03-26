//
//  CartManager.swift
//  Ecommerce
//
//  Created by Mac on 26/03/2025.
//

import Foundation
import SwiftUI

@Observable
class CartManager {
    
    var productsInCart: [ProductInCart] = []
    var addToCartAlert = false
    
    var displayTotalCartQuantity: Int {
        return productsInCart.reduce(0) { $0 + $1.quantity }
    }
    
    var displayTotalCartPrice: String {
        
         let totalPrice = productsInCart.reduce(0) {$0 + ($1.quantity * $1.product.price)}
//        var totalPrice = 0
//        for productInCart in productsInCart {
//            let total = productInCart.quantity * productInCart.product.price
//            totalPrice += total
//            
//        }
//        let formatter = NumberFormatter()
//        formatter.numberStyle = .currency
//        return formatter.string(from: totalPrice as NSNumber) ?? "$0.00"
        return "$\(totalPrice)"
    }
    
    func addToCart(product: Product) {
        if let indexOfProductInCart = productsInCart.firstIndex(where: { $0.id == product.id}){
            let currentQuantity = productsInCart[indexOfProductInCart].quantity
            let newQuantity = currentQuantity + 1
            let updatedProductInCart = ProductInCart(product: product, quantity: newQuantity)
            productsInCart[indexOfProductInCart] = updatedProductInCart
        } else {
            productsInCart.append(ProductInCart(product: product, quantity: 1))
        }
        
//        addToCartAlert = true
    }
    
    func removeFromCart(product: Product) {
        if let indexOfProductInCart = productsInCart.firstIndex(where: { $0.id == product.id }) {
            let currentQuantity = productsInCart[indexOfProductInCart].quantity
            if currentQuantity > 1 {
                let newQuantity = currentQuantity - 1
                let updatedProductInCart = ProductInCart(product: product, quantity: newQuantity)
                productsInCart[indexOfProductInCart] = updatedProductInCart
            } else {
                productsInCart.remove(at: indexOfProductInCart)
            }
         
        }
    }
}
