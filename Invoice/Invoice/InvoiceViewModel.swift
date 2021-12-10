//
//  InvoiceViewModel.swift
//  InvoiceTDD
//
//  Created by Adam on 09/12/2021.
//

import Foundation

class InvoiceViewModel {
    
    var orders: [Order]?
    var discount: Double = 0
    var total: Double = 0
    var subTotal = 0.0
    var promo: Bool = false


    
    func calculateTotal() -> Double{
        
        calcTotalOrderDiscount()
        calcAllOrdersPrices()
        total = subTotal - discount
        checkPromo()
        
        return total
    }
    
    func calcAllOrdersPrices() {
        guard let orders = orders else { return  }
        for order in orders {
            subTotal += (order.price + order.deliveryFee + order.tips)
        }
    }
    
    func calcTotalOrderDiscount() {
        guard let orders = orders else { return }
        for order in orders {
            discount += (order.partnerSale * order.price)
        }
    }
    
    func checkPromo() {
        guard let orders = orders else { return }
        if promo && orders.count > 3 {
           total -= 50
       }
   }
    
}
