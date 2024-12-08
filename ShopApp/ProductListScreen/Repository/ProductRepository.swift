//
//  ProductRepository.swift
//  ShopApp
//
//  Created by Ntobeko Sikithi on 2024/12/02.
//

import Foundation
protocol ProductRepository {
    func fetchProducts() async throws -> [Product]
}

class ProductRepositoryImplementation: ProductRepository {
    
    @Inject private var service: ShopService
    
    func fetchProducts() async throws -> [Product] {
        let products: [Product] = try await service.Get(url: EndPoints.products)
        return products
    }
    
}
