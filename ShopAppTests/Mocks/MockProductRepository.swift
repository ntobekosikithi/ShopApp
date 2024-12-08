//
//  MockProductRepository.swift
//  ShopAppTests
//
//  Created by Ntobeko Sikithi on 2024/12/07.
//

import Foundation
@testable import ShopApp


class MockProductRepository: ProductRepository {
    var stubbedProducts: [Product] = []
    var shouldThrowError: Bool = false
    var error: Error = NSError(domain: "MockProductRepositoryError", code: 0, userInfo: nil)
    var fetchProductsCallCount = 0
    
    func fetchProducts() async throws -> [Product] {
        fetchProductsCallCount += 1

        if shouldThrowError {
            throw error
        }
        
        return stubbedProducts
    }
    
    static func createMockProduct(
        id: Int = 1,
        name: String = "Test Product",
        description: String = "Test Description",
        price: Double = 9.99,
        currencyCode: String = "USD",
        currencySymbol: String = "$",
        quantity: Int = 10,
        imageLocation: String = "test/image.jpg",
        status: String = "Active"
    ) -> Product {
        return Product(
            id: id,
            name: name,
            description: description,
            price: price,
            currencyCode: currencyCode,
            currencySymbol: currencySymbol,
            quantity: quantity,
            imageLocation: imageLocation,
            status: status
        )
    }
    
    static func createMockProducts(count: Int = 3) -> [Product] {
        return (1...count).map { index in
            createMockProduct(id: index)
        }
    }
}
