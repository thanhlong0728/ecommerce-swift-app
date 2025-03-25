//
//  PrimaryButtonStyle.swift
//  Ecommerce
//
//  Created by Mac on 25/03/2025.
//

import Foundation
import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .font(.system(size: 15, weight: .bold))
            .foregroundStyle(.white)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .frame(height: 45)
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 8))
           
    }
}
