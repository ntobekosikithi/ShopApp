//
//  ProductListView.swift
//  ShopApp
//
//  Created by Ntobeko Sikithi on 2024/12/03.
//

import Foundation
import SwiftUI

struct ProductListView: View {
    @StateObject private var viewModel = ProductsViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                switch viewModel.loadingState {
                case .loading:
                    ProgressView("\(.localized(.loadingIndicatorTitle))")
                        .progressViewStyle(CircularProgressViewStyle())
                        .background(Color.white)
                
                case .error(let message):
                    ErrorView(title: .localized(.errorFetchingProductsTitle), errorMessage: message) {
                        await viewModel.fetchProducts()
                    }
                
                case .loaded:
                    productItemView(viewModel.products)
                }
            }
            .background(Color(hex: hexColors.sceneBackground))
            .navigationTitle("\(.localized(.productListScreenTitle))")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing:
                NavigationLink(destination: CartView()) {
                    CartBadgeView()
                }
            )
            .task {
                Task { await viewModel.fetchProducts() }
            }
            .refreshable {
                await viewModel.fetchProducts()
            }
        }
    }
    
    @ViewBuilder
    private func productItemView(_ products: [Product]) -> some View {
        ScrollView {
            LazyVGrid(columns: [
                GridItem(.flexible()),
                GridItem(.flexible())
            ], spacing: 16) {
                ForEach(products) { product in
                    NavigationLink(destination: ProductDetailsView(product: product)) {
                        ProductCard(product: product)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .padding(16)
        }
        .animation(.default, value: products)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView()
    }
}

