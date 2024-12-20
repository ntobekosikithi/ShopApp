//
//  Encodable+Extensions.swift
//  ShopApp
//
//  Created by Ntobeko Sikithi on 2024/12/02.
//

import Foundation
extension Encodable {
    var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data)) as? [String: Any]
    }
}
