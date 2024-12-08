//
//  ProductDetailsView.swift
//  ShopApp
//
//  Created by Ntobeko Sikithi on 2024/12/05.
//

import SwiftUI

struct ProductDetailsView: View {
    let product: Product
    @EnvironmentObject var cartManager: CartManager
    @Environment(\.presentationMode) var presentationMode
    @State private var showingAddedToCartAlert = false
    @State private var showingRemovedFromCartAlert = false
    @State private var showingCheckoutScreen = false
    
    private let minImageHeight: CGFloat = 250
    private let maxImageHeight: CGFloat = 350
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                productImageSection

                VStack(alignment: .leading, spacing: 10) {
                    productTitleAndPriceSection
                    
                    Divider()
                    stockStatusView
                }
                .padding(.horizontal)

                descriptionSection
                actionButtonsSection
            }
            .toast(isShowing: $showingAddedToCartAlert,
                   message: .localized(.successProductAddedToCartMessage),
                   style: .success)
            .toast(isShowing: $showingRemovedFromCartAlert,
                   message: .localized(.successProductRemovedFromCartMessage),
                   style: .success)
        }
        .background(Color(hex: hexColors.sceneBackground))
        .navigationTitle("\(.localized(.productDetailsScreenTitle))")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(
            leading:
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                        .imageScale(.large)
            },trailing: 
                NavigationLink(destination: CartView()) {
                    CartBadgeView()
                }
        )
        .navigationBarBackButtonHidden(true)
    }
    
    // MARK: - Component Views
    
    private var productImageSection: some View {
        AsyncImage(url: URL(string: product.imageLocation)) { phase in
            switch phase {
            case .empty:
                ProgressView()
                    .frame(maxWidth: .infinity, minHeight: minImageHeight)
                    .background(Color.gray.opacity(0.1))
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, minHeight: minImageHeight, maxHeight: maxImageHeight)
                    .cornerRadius(15)
                    .shadow(radius: 5)
            case .failure:
                Image(systemName: "photo.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, minHeight: minImageHeight)
                    .foregroundColor(.gray)
                    .background(Color.gray.opacity(0.1))
            @unknown default:
                EmptyView()
            }
        }
        .padding(.bottom, 10)
    }
    
    private var productTitleAndPriceSection: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(product.name)
                .font(.title2)
                .fontWeight(.bold)
            
            Text(product.price.formatPrice())
                .font(.title3)
                .foregroundColor(.secondary)
        }
    }
    
    private var stockStatusView: some View {
        HStack {
            Image(systemName: product.quantity > 0 ? "checkmark.circle.fill" : "exclamationmark.triangle.fill")
                .foregroundColor(product.quantity > 0 ? .green : .red)
            
            Text(verbatim: product.quantity > 0 ? .localized(.inStocklabelTitle) : .localized(.outStocklabelTitle))
                .font(.subheadline)
        }
    }
    
    private var descriptionSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("\(.localized(.productDetailsDescTitle))")
                .font(.headline)
            
            Text(product.description)
                .font(.body)
                .foregroundColor(.secondary)
        }
        .padding(.horizontal)
    }
    
    private var actionButtonsSection: some View {
        
        VStack(alignment: .center, spacing: 15) {
            
            CustomButton (
                title: cartManager.isInCart(product) ? .localized(.removeFromCartButtonTitle) : .localized(.addToCartButtonTitle),
                action: {
                    if cartManager.isInCart(product) {
                        cartManager.removeFromCart(product)
                        showingRemovedFromCartAlert = true
                    } else {
                        cartManager.addToCart(product)
                        showingAddedToCartAlert = true
                    }
                },
                style: cartManager.isInCart(product) ? .removeFromCart : .cartButton,
                isDisabled: product.quantity == 0
            )
            
            CustomButton (
                title: .localized(.buyNowButtonTitle),
                action: {
                    showingCheckoutScreen = true
                },
                style: .buyNowButton,
                isDisabled: product.quantity == 0,
                isGrayedOut: product.quantity < 1
            ).sheet(isPresented: $showingCheckoutScreen) {
                CheckoutView()
             }
        }
        .padding()
    }
}
