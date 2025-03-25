//
//  ProductGridViewModel.swift
//  Ecommerce
//
//  Created by Mac on 25/03/2025.
//

import Foundation
import SwiftUI

@Observable
class ProductGridViewModel {
    
    let filter: ProductFilter
    
    var products: [Product] {
        switch filter {
        case .all:
            ProductsClient.fetchProducts()
        case .isFeatured:
            ProductsClient.fetchProducts().filter({$0.isFeatured})
        case .highlyRated:
            ProductsClient.fetchProducts().filter({$0.rating > 4})
        }
    }
    
    init(filter: ProductFilter) {
        self.filter = filter
    }
}
