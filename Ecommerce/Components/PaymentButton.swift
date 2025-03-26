//
//  PaymentButton.swift
//  Ecommerce
//
//  Created by Mac on 26/03/2025.
//

import SwiftUI
import PassKit

struct PaymentButton: UIViewRepresentable {
    
    let button = PKPaymentButton(paymentButtonType: .checkout, paymentButtonStyle: .automatic)
    var action: () -> Void
    
    func makeUIView(context: Context) -> some UIView {
        
        return button
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
    
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(button: button, action: action)
    }
    
    class Coordinator: NSObject {
        var action: () -> Void
        
        init(button: PKPaymentButton, action: @escaping () -> Void) {
            self.action = action
            super.init()
            button.addTarget(self, action: #selector(callBack), for: .touchUpInside)
        }
        
        @objc func callBack() {
            action()
        }
    }
}
