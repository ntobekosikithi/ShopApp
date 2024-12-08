//
//  CartManager.swift
//  ShopApp
//
//  Created by Ntobeko Sikithi on 2024/12/06.
//

import Foundation
import SwiftUI

class CartManager: ObservableObject {
    @Published var cartItems: [CartItem] = []
    
    func addToCart(_ product: Product) {
        removeFromCart(product)
        if product.quantity > 0 {
            cartItems.append(CartItem(product: product, quantity: 1))
        }
    }
    
    func removeFromCart(_ product: Product) {
        cartItems.removeAll { $0.product.id == product.id }
    }
    
    func isInCart(_ product: Product) -> Bool {
        cartItems.contains { $0.product.id == product.id }
    }
    
    var totalItems: Int {
        cartItems.reduce(0) { $0 + $1.quantity }
    }
    
    func totalPrice() -> Double {
        cartItems.reduce(0) { total, item in
            total + (Double(item.product.price)) * Double(item.quantity)
        }
    }
}
