//
//  Product.swift
//  ShopApp
//
//  Created by Ntobeko Sikithi on 2024/12/02.
//

import Foundation

struct Product: Codable, Identifiable, Hashable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let currencyCode: String
    let currencySymbol: String
    let quantity: Int
    let imageLocation: String
    let status: String
}
