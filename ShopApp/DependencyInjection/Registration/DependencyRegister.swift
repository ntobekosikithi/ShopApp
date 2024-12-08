//
//  DependencyRegister.swift
//  ShopApp
//
//  Created by Ntobeko Sikithi on 2024/12/02.
//

import Foundation

func registerAllDependencies() {
    let container = DIContainer.instance
    container.register(ShopService.self) { ShopServiceImplementation() }
    container.register(ProductRepository.self) { ProductRepositoryImplementation() }

}
