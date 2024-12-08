//
//  Double+Extensions.swift
//  ShopApp
//
//  Created by Ntobeko Sikithi on 2024/12/06.
//

import Foundation

extension Double {
    func formatPrice(with currencySymbol: String = "$") -> String {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = .currency
        currencyFormatter.currencySymbol = currencySymbol
        currencyFormatter.minimumFractionDigits = 2
        currencyFormatter.maximumFractionDigits = 2
        return currencyFormatter.string(from: NSNumber(value: self)) ?? ""
    }
}
