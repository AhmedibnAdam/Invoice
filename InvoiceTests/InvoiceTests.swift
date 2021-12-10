//
//  InvoiceTests.swift
//  InvoiceTests
//
//  Created by Adam on 09/12/2021.
//

import XCTest
@testable import Invoice

class InvoiceTests: XCTestCase {
    
    var invoiceViewModel: InvoiceViewModel!

    override func setUpWithError() throws {
        invoiceViewModel = InvoiceViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_InvoiceTotal() throws {
        // Given
        let order = Order(price: 5.0, partnerSale: 0.0, deliveryFee: 0.0, tips: 0.0)
        invoiceViewModel.orders = [order]
        
        // When
        let total = invoiceViewModel.calculateTotal()
     
        // Then
        XCTAssertEqual(total, 5)
    }
    
    func test_InvoiceTotalWithDelivery() throws {
        // Given
        let order = Order(price: 100.0, partnerSale: 0.0, deliveryFee: 10.0, tips: 0.0)
        invoiceViewModel.orders = [order]
        
        // When
        let total = invoiceViewModel.calculateTotal()
     
        // Then
        XCTAssertEqual(total, 110)
    }
    
    func test_InvoiceTotalWithDeliveryAndTips() throws {
        // Given
        let order = Order(price: 100.0, partnerSale: 0.0, deliveryFee: 10.0, tips: 5.0)
        invoiceViewModel.orders = [order]
        
        // When
        let total = invoiceViewModel.calculateTotal()
     
        // Then
        XCTAssertEqual(total, 115)
    }

    
    func test_InvoiceTotalWithDeliveryAndTipsAndDiscound() throws {
        // Given
        let order = Order(price: 100.0, partnerSale: 0.2, deliveryFee: 10.0, tips: 5.0)
        invoiceViewModel.orders = [order]
        
        // When
        let total = invoiceViewModel.calculateTotal()
     
        // Then
        XCTAssertEqual(total, 95)
    }
    
    
    func test_InvoiceTotalManyOrders() throws {
        // Given
        let order1 = Order(price: 5.0, partnerSale: 0.0, deliveryFee: 0.0, tips: 0.0)
        let order2 = Order(price: 5.0, partnerSale: 0.0, deliveryFee: 0.0, tips: 0.0)
        let order3 = Order(price: 5.0, partnerSale: 0.0, deliveryFee: 0.0, tips: 0.0)
        
        let orderArr = [order1, order2, order3]
        invoiceViewModel.orders = orderArr
        
        // When
        let total = invoiceViewModel.calculateTotal()
     
        // Then
        XCTAssertEqual(total, 15)
    }
    
    func test_InvoiceTotalManyOrdersWithDiffrentValues() throws {
        // Given
        let order1 = Order(price: 100.0, partnerSale: 0.1, deliveryFee: 10.0, tips: 0.0) // 100
        let order2 = Order(price: 200.0, partnerSale: 0.2, deliveryFee: 20.0, tips: 5.0) // 185
        let order3 = Order(price: 300.0, partnerSale: 0.5, deliveryFee: 20.0, tips: 10.0) // 180
        
        let orderArr = [order1, order2, order3]
        invoiceViewModel.orders = orderArr
        
        // When
        let total = invoiceViewModel.calculateTotal()
     
        // Then
        XCTAssertEqual(total, 465)
    }
    
    func test_InvoiceTotalWithPromo() throws {
        // Given
        let order = Order(price: 500.0, partnerSale: 0.0, deliveryFee: 0.0, tips: 0.0)
        let order1 = Order(price: 100.0, partnerSale: 0.1, deliveryFee: 10.0, tips: 0.0) // 100
        let order2 = Order(price: 200.0, partnerSale: 0.2, deliveryFee: 20.0, tips: 5.0) // 185
        let order3 = Order(price: 300.0, partnerSale: 0.5, deliveryFee: 20.0, tips: 10.0) // 180
        invoiceViewModel.orders = [order, order1, order2, order3]
        invoiceViewModel.promo = true
        
        // When
        let total = invoiceViewModel.calculateTotal()
     
        // Then
        XCTAssertEqual(total, 915)
    }
    
    func test_InvoiceTotalWithPromoIfOrderMoreThanThree() throws {
        // Given
        let order = Order(price: 500.0, partnerSale: 0.0, deliveryFee: 0.0, tips: 0.0)

        invoiceViewModel.orders = [order]
        invoiceViewModel.promo = true
        
        // When
        let total = invoiceViewModel.calculateTotal()
     
        // Then
        XCTAssertEqual(total, 500)
    }

}

