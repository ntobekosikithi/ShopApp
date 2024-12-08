//
//  CartManagerTests.swift
//  ShopAppTests
//
//  Created by Ntobeko Sikithi on 2024/12/08.
//

import Foundation
import XCTest

@testable import ShopApp

class CartManagerTests: XCTestCase {
    var cartManager: CartManager!
    
    override func setUp() {
        super.setUp()
        cartManager = CartManager()
    }
    
    override func tearDown() {
        cartManager = nil
        super.tearDown()
    }
    
    func testInitialState() {
        XCTAssertTrue(cartManager.cartItems.isEmpty)
        XCTAssertEqual(cartManager.totalItems, 0)
        XCTAssertEqual(cartManager.totalPrice(), 0)
    }
    
    func testAddToCart() {
        
        let product = MockProductRepository.createMockProduct(
            id: 1,
            price: 10.0,
            quantity: 5
        )
        
        cartManager.addToCart(product)

        XCTAssertEqual(cartManager.cartItems.count, 1)
        XCTAssertEqual(cartManager.cartItems.first?.product.id, product.id)
        XCTAssertEqual(cartManager.cartItems.first?.quantity, 1)
        XCTAssertTrue(cartManager.isInCart(product))
    }
    
    func testAddToCartWithZeroQuantity() {
        let product = MockProductRepository.createMockProduct(
            id: 1,
            price: 10.0,
            quantity: 0
        )
        
        cartManager.addToCart(product)

        XCTAssertTrue(cartManager.cartItems.isEmpty)
        XCTAssertFalse(cartManager.isInCart(product))
    }
    
    func testRemoveFromCart() {
        let product = MockProductRepository.createMockProduct(id: 1, price: 10.0)
        cartManager.addToCart(product)

        cartManager.removeFromCart(product)

        XCTAssertTrue(cartManager.cartItems.isEmpty)
        XCTAssertFalse(cartManager.isInCart(product))
    }
    
    func testAddMultipleUniqueProducts() {
        let product1 = MockProductRepository.createMockProduct(id: 1, price: 10.0)
        let product2 = MockProductRepository.createMockProduct(id: 2, price: 20.0)

        cartManager.addToCart(product1)
        cartManager.addToCart(product2)

        XCTAssertEqual(cartManager.cartItems.count, 2)
        XCTAssertTrue(cartManager.isInCart(product1))
        XCTAssertTrue(cartManager.isInCart(product2))
    }
    
    func testAddSameProductMultipleTimes() {
        let product = MockProductRepository.createMockProduct(id: 1, price: 10.0)

        cartManager.addToCart(product)
        cartManager.addToCart(product)

        XCTAssertEqual(cartManager.cartItems.count, 1)
        XCTAssertEqual(cartManager.cartItems.first?.quantity, 1)
    }
    
    func testTotalItems() {
        let product1 = MockProductRepository.createMockProduct(id: 1, price: 10.0)
        let product2 = MockProductRepository.createMockProduct(id: 2, price: 20.0)

        cartManager.addToCart(product1)
        cartManager.addToCart(product2)

        XCTAssertEqual(cartManager.totalItems, 2)
    }
    
    func testTotalPrice() {
        let product1 = MockProductRepository.createMockProduct(id: 1, price: 10.0)
        let product2 = MockProductRepository.createMockProduct(id: 2, price: 20.0)

        cartManager.addToCart(product1)
        cartManager.addToCart(product2)

        XCTAssertEqual(cartManager.totalPrice(), 30.0)
    }
    
    func testIsInCart() {
        let product1 = MockProductRepository.createMockProduct(id: 1, price: 10.0)
        let product2 = MockProductRepository.createMockProduct(id: 2, price: 20.0)

        cartManager.addToCart(product1)

        XCTAssertTrue(cartManager.isInCart(product1))
        XCTAssertFalse(cartManager.isInCart(product2))
    }
}
