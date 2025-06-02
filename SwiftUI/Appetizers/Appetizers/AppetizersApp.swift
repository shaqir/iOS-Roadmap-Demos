//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Sakir Saiyed on 30/05/25.
//

import SwiftUI

@main // Entry Point of Program
struct AppetizersApp: App {
    
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView()
                .environmentObject(order)
        }
    }
}
