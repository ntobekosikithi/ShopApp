//
//  CustomToast.swift
//  ShopApp
//
//  Created by Ntobeko Sikithi on 2024/12/06.
//

import SwiftUI

enum ToastStyle {
    case success
    case error
    case warning
    
    var backgroundColor: Color {
        switch self {
        case .success: return .green
        case .error: return .red
        case .warning: return .orange
        }
    }
}

struct Toast: ViewModifier {
    @Binding var isShowing: Bool
    let message: String
    let style: ToastStyle
    
    func body(content: Content) -> some View {
        ZStack(alignment: .top) {
            content
            
            if isShowing {
                HStack {
                    Image(systemName: getIcon())
                    Text(message)
                }
                .foregroundColor(.white)
                .font(.caption)
                .padding(.horizontal)
                .frame(height: 30)
                .background(style.backgroundColor)
                .cornerRadius(8)
                .transition(.move(edge: .bottom))
                .animation(.default, value: isShowing)
                .padding(.bottom, 10)
            }
        }
        .onChange(of: isShowing) { oldValue, newValue in
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                isShowing = false
            }
        }
    }
    
    func getIcon() -> String {
        switch style {
        case .success: return "checkmark.circle.fill"
        case .error: return "xmark.circle.fill"
        case .warning: return "exclamationmark.triangle.fill"
        }
    }
}

extension View {
    func toast(isShowing: Binding<Bool>,
               message: String,
               style: ToastStyle = .success) -> some View {
        modifier(Toast(isShowing: isShowing,
                       message: message,
                       style: style))
    }
}
