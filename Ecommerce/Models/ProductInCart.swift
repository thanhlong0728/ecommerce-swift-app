//
//  ProductInCart.swift
//  Ecommerce
//
//  Created by Mac on 26/03/2025.
//

import Foundation
import SwiftUI

struct ProductInCart: Identifiable {
    var id: String {
        product.id
    }
    let product: Product
    var quantity: Int
}
