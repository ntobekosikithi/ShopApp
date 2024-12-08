//
//  ShopAppApp.swift
//  ShopApp
//
//  Created by Ntobeko Sikithi on 2024/12/02.
//

import UIKit
import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        registerAllDependencies()
        return true
    }
}

@main
struct ShopAppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject private var cartManager = CartManager()
    
    var body: some Scene {
        WindowGroup {
            ProductListView()
                .environmentObject(cartManager)
        }
    }
}
