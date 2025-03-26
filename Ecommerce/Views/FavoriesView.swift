//
//  FavoriesView.swift
//  Ecommerce
//
//  Created by Mac on 25/03/2025.
//

import SwiftUI

struct FavoriesView: View {
    
    @Environment(FavoriesManager.self) var favoriesManager : FavoriesManager
    
    fileprivate func FavoriteProductRow(product: Product) -> some View {
        HStack {
            Image(product.image)
                .squareImageStyle()
            VStack(alignment: .leading) {
                Text(product.title)
                    .font(.system(size: 15, weight: .semibold))
                    .padding(.bottom,1)
                Text(product.description)
                    .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                    .font(.system(size: 15))
            }
            Button(action: {
                favoriesManager.products.removeAll(where: { $0.id == product.id })
            }, label: {
                Image(systemName: "heart.fill")
            })
        }
    }
    
    var body: some View {
        VStack {
            List(favoriesManager.products) {
                product in
                FavoriteProductRow(product: product)
            }
        }
        .overlay {
            if favoriesManager.products.count == 0 {
                Text("Nothing to see here")
            }
        }
    }
}

#Preview {
    FavoriesView()
        .environment(FavoriesManager())
}
