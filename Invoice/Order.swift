//
//  Order.swift
//  InvoiceTDD
//
//  Created by Adam on 09/12/2021.
//

import Foundation

struct Order {
    let price: Double
    let partnerSale: Double
    let deliveryFee: Double
    let tips: Double

    
    init(price: Double, partnerSale: Double,deliveryFee: Double,tips: Double) {
        self.price = price
        self.partnerSale = partnerSale
        self.deliveryFee = deliveryFee
        self.tips = tips
    }
}
