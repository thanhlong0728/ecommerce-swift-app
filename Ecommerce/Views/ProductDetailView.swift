//
//  ProductDetailView.swift
//  Ecommerce
//
//  Created by Mac on 25/03/2025.
//

import SwiftUI

struct ProductDetailView: View {
    
    let product: Product
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image(product.image)
                    .bannerImageStyle()
                Group {
                    Text(product.title)
                        .font(.system(size: 20, weight: .semibold))
                        .padding(.bottom, 5)
                    Text(product.description)
                        .font(.system(size: 15))
                        .padding(.bottom, 15)
                    Button(action: {
                        
                    }, label: {
                        Text("Add to Cart")
                    })
                    .buttonStyle(PrimaryButtonStyle())
                }
                .padding(.horizontal)
                Spacer()
            }
        }
    }
}

#Preview {
    ProductDetailView(product: ProductsClient.fetchProducts()[0])
}
