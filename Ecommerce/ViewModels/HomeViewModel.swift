//
//  HomeViewModel.swift
//  Ecommerce
//
//  Created by Mac on 25/03/2025.
//

import Foundation
import SwiftUI

@Observable
class HomeViewModel {
    var showAllProduct = false
    
    var featuredProducts = ProductsClient.fetchProducts().filter({$0.isFeatured})
    
    func fetProducts(filter: ProductFilter) -> [Product] {
        switch filter {
        case .all:
            ProductsClient.fetchProducts()
        case .isFeatured:
            ProductsClient.fetchProducts().filter({$0.isFeatured})
        case .highlyRated:
            ProductsClient.fetchProducts().filter({$0.rating > 4})
        }
    }
}
