//
//  CartItem.swift
//  ShopApp
//
//  Created by Ntobeko Sikithi on 2024/12/07.
//

import Foundation

struct CartItem: Codable, Identifiable, Hashable {
    let product: Product
    var quantity: Int
    
    var id: Int { product.id }
}
