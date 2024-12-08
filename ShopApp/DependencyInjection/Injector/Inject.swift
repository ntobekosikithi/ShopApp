//
//  Inject.swift
//  ShopApp
//
//  Created by Ntobeko Sikithi on 2024/12/02.
//

import Foundation

@propertyWrapper public struct Inject<T> {
    public var wrappedValue: T {
        return instance
    }

    private var instance: T
    public init() {
        instance = ResolverFactory.resolve(dependency: T.self)
    }
}
