//
//  CartBadgeView.swift
//  ShopApp
//
//  Created by Ntobeko Sikithi on 2024/12/06.
//

import SwiftUI

struct CartBadgeView: View {
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image(systemName: "cart.fill")
                .foregroundColor(.black)
            
            if cartManager.totalItems > 0 {
                Text("\(cartManager.totalItems)")
                    .font(.caption2)
                    .foregroundColor(.white)
                    .padding(4)
                    .background(Color.red)
                    .clipShape(Circle())
                    .offset(x: 5, y: -8)
            }
        }
    }
}

#Preview {
    CartBadgeView()
}
