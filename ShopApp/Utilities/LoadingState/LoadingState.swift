//
//  LoadingState.swift
//  ShopApp
//
//  Created by Ntobeko Sikithi on 2024/12/06.
//

import Foundation

enum LoadingState: Equatable {
    case loading
    case loaded
    case error(String)
}
