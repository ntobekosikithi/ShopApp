//
//  ProductCard.swift
//  ShopApp
//
//  Created by Ntobeko Sikithi on 2024/12/06.
//

import SwiftUI

import SwiftUI

struct ProductCard: View {
    let product: Product
    
    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            productImageView
            
            VStack(alignment: .center, spacing: 4) {
                productNameView
                productPriceView
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color(hex: hexColors.productCardBackground))
        .cornerRadius(8)
    }
    
    private var productImageView: some View {
        GeometryReader { geometry in
            AsyncImage(url: URL(string: product.imageLocation)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .aspectRatio(1, contentMode: .fit)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                case .failure:
                    Image(systemName: "photo.fill")
                        .resizable()
                        .scaledToFit()
                        .aspectRatio(1, contentMode: .fit)
                        .background(Color.gray.opacity(0.1))
                        .frame(width: geometry.size.width, height: geometry.size.height)
                @unknown default:
                    EmptyView()
                }
            }
        }
        .aspectRatio(1, contentMode: .fit)
        .frame(maxWidth: .infinity, maxHeight: 80)
    }

    private var productNameView: some View {
        Text(product.name)
            .font(.headline)
            .multilineTextAlignment(.center)
    }
    
    private var productPriceView: some View {
        Text(product.price.formatPrice())
            .font(.subheadline)
            .foregroundColor(.secondary)
    }
}

