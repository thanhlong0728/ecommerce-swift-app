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
    
    var featuredProducts = ProductsClient.fetchProducts().filter({$0.isFeatured})
}
