//
//  CustomButton.swift
//  ShopApp
//
//  Created by Ntobeko Sikithi on 2024/12/08.
//

import Foundation
import SwiftUI

struct CustomButton: View {
    // Button configuration
    let title: String
    let action: () -> Void
    
    // Style configurations
    var style: ButtonStyle = .customButton
    var isDisabled: Bool = false
    var isGrayedOut: Bool = false
    
    // Optional icon
    var icon: String?
    
    var body: some View {
        Button(action: action) {
            HStack {
                
                // Show icon if provided
                if let iconName = icon {
                    Image(systemName: iconName)
                }
                
                // Button text
                Text(title)
            }
            .frame(maxWidth: .infinity)
            .font(.headline)
            .padding()
            .background(isGrayedOut ? .gray : style.backgroundColor)
            .foregroundColor(style.textColor)
            .cornerRadius(10)
            .opacity(isDisabled ? 0.6 : 1.0)
        }
        .disabled(isDisabled)
    }
    
    // Button style variations
    enum ButtonStyle {
        case customButton
        case cartButton
        case removeFromCart
        case buyNowButton
        
        var backgroundColor: Color {
            switch self {
            case .customButton: return .blue
            case .cartButton: return .black
            case .removeFromCart: return .red
            case .buyNowButton: return Color(hex: hexColors.buyButton)
            }
        }
        
        var textColor: Color {
            switch self {
            case .customButton: return .white
            case .cartButton: return .white
            case .removeFromCart: return .white
            case .buyNowButton: return .white
            }
        }
    }
}
