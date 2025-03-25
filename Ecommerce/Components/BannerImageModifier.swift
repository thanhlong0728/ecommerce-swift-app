//
//  BannerImageModifier.swift
//  Ecommerce
//
//  Created by Mac on 25/03/2025.
//

import SwiftUI
import Foundation

extension Image{
    func bannerImageStyle() -> some View {
         self
            .resizable()
            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
            .frame(width: UIScreen.main.bounds.width,height: 250)
            .clipped()
    }
}


