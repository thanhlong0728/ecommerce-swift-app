//
//  SquareImageModifier.swift
//  Ecommerce
//
//  Created by Mac on 26/03/2025.
//

import SwiftUI
import Foundation

extension Image{
    func squareImageStyle() -> some View {
         self
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 70, height: 70)
    }
}
