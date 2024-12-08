//
//  ProductsViewModel.swift
//  ShopApp
//
//  Created by Ntobeko Sikithi on 2024/12/03.
//

import Foundation

class ProductsViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published private(set) var loadingState: LoadingState = .loading
    
    @Inject private var repository: ProductRepository
    
    @MainActor
    func fetchProducts() async {
        loadingState = .loading
        
        do {
            products = try await repository.fetchProducts()
            loadingState = .loaded
        } catch {
            loadingState = .error(.localized(.errorFetchingProductsDesc))
        }
    }
}
