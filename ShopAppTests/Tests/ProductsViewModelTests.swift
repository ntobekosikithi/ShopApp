//
//  ProductsViewModelTests.swift
//  ShopAppTests
//
//  Created by Ntobeko Sikithi on 2024/12/07.
//

import Foundation
import XCTest
@testable import ShopApp

class ProductsViewModelTests: XCTestCase {
    var container: DIContainer = DIContainer.instance
    var mockRepository: MockProductRepository!
    var serviceUnderTest: ProductsViewModel!
    
    override func setUp() {
        super.setUp()
        container = DIContainer.instance
        mockRepository = MockProductRepository()
        container.register(ProductRepository.self, implementation: {
            return self.mockRepository
        })
        
        serviceUnderTest = ProductsViewModel()
    }
    
    override func tearDown() {
        serviceUnderTest = nil
        mockRepository = nil
        container.reset()
        super.tearDown()
    }
    
    func testFetchProductsSuccess() async {
        let mockProducts = MockProductRepository.createMockProducts(count: 3)
        mockRepository.stubbedProducts = mockProducts
        
        await serviceUnderTest.fetchProducts()
        
        XCTAssertEqual(serviceUnderTest.products, mockProducts)
        XCTAssertEqual(serviceUnderTest.loadingState, .loaded)
        XCTAssertEqual(mockRepository.fetchProductsCallCount, 1)
    }
    
    func testFetchProductsFailure() async {
        mockRepository.shouldThrowError = true
        mockRepository.error = NSError(domain: "TestError", code: 500, userInfo: nil)

        await serviceUnderTest.fetchProducts()

        XCTAssertTrue(serviceUnderTest.products.isEmpty)
        XCTAssertEqual(serviceUnderTest.loadingState, .error(.localized(.errorFetchingProductsDesc)))
    }

    func testFetchProductsEmptyResult() async {
        mockRepository.stubbedProducts = []

        await serviceUnderTest.fetchProducts()

        XCTAssertTrue(serviceUnderTest.products.isEmpty)
        XCTAssertEqual(serviceUnderTest.loadingState, .loaded)
    }
}
