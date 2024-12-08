//
//  ResolverFactory.swift
//  ShopApp
//
//  Created by Ntobeko Sikithi on 2024/12/02.
//

import Foundation
import Swinject

protocol Resolving {
    static func resolve<T>(dependency: T.Type) -> T
    static func reset()
}

class ResolverFactory {
    private static var container: Resolve = DIContainer.instance
}

extension ResolverFactory: Resolving {
    
    static func resolve<T>(dependency: T.Type) -> T {
        return container.resolve(dependency)
    }
    
    static func reset() {
        container.reset()
    }
    
}
