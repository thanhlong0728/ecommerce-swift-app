//
//  ProductGridView.swift
//  Ecommerce
//
//  Created by Mac on 25/03/2025.
//

import SwiftUI

struct ProductGridView: View {
    
    @State var viewModel : ProductGridViewModel
    
    init(filter: ProductFilter) {
        self.viewModel = ProductGridViewModel(filter: filter)
    }
    
    var body: some View {
        
        VStack{
            TwoColumnGrid {
                ForEach(viewModel.products){
                    product in
                    ProductRow(product: product)
                }
            }
        }
    }
}

#Preview {
    ProductGridView(filter:.all)
}
