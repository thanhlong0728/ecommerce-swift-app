//
//  PaymentService.swift
//  Ecommerce
//
//  Created by Mac on 26/03/2025.
//

import Foundation
import PassKit

class PaymentService: NSObject {
    
    var paymentController: PKPaymentAuthorizationController?
    var paymentStatus = PKPaymentAuthorizationStatus.failure
    var paymentCompletionHandler: ((Bool) -> Void)?
    
    private func shippingMethodCalculator() -> [PKShippingMethod] {
        let today = Date()
        let calendar = Calendar.current
        
        let shippingStart = calendar.date(byAdding: .day, value: 5, to: today)
        let shippingEnd = calendar.date(byAdding: .day, value: 10, to: today)
        
        if let shippingStart = shippingStart,
           let shippingEnd = shippingEnd {
            
            let startComponents = calendar.dateComponents([.calendar, .year, .month, .day], from: shippingStart)
            let endComponents = calendar.dateComponents([.calendar, .year, .month, .day], from: shippingEnd)
            
            let freeShippingDelivery = PKShippingMethod(label: "Free Delivery", amount: NSDecimalNumber(value: 0.0))
            freeShippingDelivery.dateComponentsRange = PKDateComponentsRange(start: startComponents, end: endComponents)
            freeShippingDelivery.detail = "Free Delivery"
            freeShippingDelivery.identifier = "FREEDELIVERY"
            return [freeShippingDelivery]
        }
        
        return []
    }
    
    func startPayment(productInCart: [ProductInCart], completion: @escaping (Bool) -> Void) {
        
        paymentCompletionHandler = completion
        
        // create payment summary items
        var paymentSummaryItems: [PKPaymentSummaryItem] = []
        
        paymentSummaryItems.removeAll()
        paymentSummaryItems = productInCart.map({PKPaymentSummaryItem(label: "\($0.product.title) x \($0.quantity)", amount: NSDecimalNumber(value: $0.product.price * $0.quantity) , type: .final)})
        let totalPrice = productInCart.reduce(0){ $0 + ($1.product.price)}
        let total = PKPaymentSummaryItem(label: "Total", amount: NSDecimalNumber(value: totalPrice), type: .final)
        paymentSummaryItems.append(total)
        
        // create payment request
        let paymentRequest = PKPaymentRequest()
        paymentRequest.paymentSummaryItems = paymentSummaryItems
        paymentRequest.merchantIdentifier = "merchant.com.sharebilldev.appdemo"
        paymentRequest.supportedNetworks = [.visa, .masterCard]
        paymentRequest.merchantCapabilities = .threeDSecure
        paymentRequest.countryCode = "US"
        paymentRequest.currencyCode = "USD"
        paymentRequest.shippingType = .delivery
        paymentRequest.requiredShippingContactFields = [.name, .postalAddress]
        paymentRequest.shippingMethods = shippingMethodCalculator()
    
        paymentController = PKPaymentAuthorizationController(paymentRequest: paymentRequest)
        paymentController?.delegate = self
        paymentController?.present(completion: {
            presented in
            if presented {
                print("Payment controller successfully presented")
            }else {
                print("Payment controller failed to show")
            }
        })
    }
}

extension PaymentService: PKPaymentAuthorizationControllerDelegate {
    
    func paymentAuthorizationController(_ controller: PKPaymentAuthorizationController, didAuthorizePayment payment: PKPayment, handler completion: @escaping (PKPaymentAuthorizationResult) -> Void) {
        let status = PKPaymentAuthorizationStatus.success
        paymentStatus = status
        let errors = [Error]()
        completion(PKPaymentAuthorizationResult(status: status, errors: errors))
    }
    
    func paymentAuthorizationControllerDidFinish(_ controller: PKPaymentAuthorizationController) {
        controller.dismiss {
            DispatchQueue.main.sync {
                if self.paymentStatus == .success {
                    self.paymentCompletionHandler?(true)
                }else {
                    self.paymentCompletionHandler?(false)
                }
            }
        }
    }
    
    
}
