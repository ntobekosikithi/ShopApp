//
//  Localizable.swift
//  ShopApp
//
//  Created by Ntobeko Sikithi on 2024/12/07.
//

import Foundation

struct Localizable {
    fileprivate let contents: String
    
    init(_ contents: String) {
        self.contents = contents
    }
}

extension String {
    
    /// Returns a localized string.
    static func localized(_ key: Localizable) -> String {
        return key.contents
    }
}
