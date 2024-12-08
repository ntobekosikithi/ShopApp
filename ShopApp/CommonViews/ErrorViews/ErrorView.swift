//
//  ErrorView.swift
//  ShopApp
//
//  Created by Ntobeko Sikithi on 2024/12/06.
//

import SwiftUI

struct ErrorView: View {
    let title: String
    let errorMessage: String
    let retryAction: () async -> Void
    
    var body: some View {
        VStack(spacing: 14) {
            Text(title)
                .font(.headline)
                .foregroundColor(.red)
            
            Text(errorMessage)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            Button(action: {
                Task { await retryAction() }
            }) {
                Text("Retry")
                    .padding(.horizontal)
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(8)
        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}


#Preview {
    ErrorView(title: "Error title", errorMessage: "Error message") {
        try? await Task.sleep(nanoseconds: 1_000_000_000)
    }
}
