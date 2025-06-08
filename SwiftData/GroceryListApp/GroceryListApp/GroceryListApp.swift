//
//  GroceryListAppApp.swift
//  GroceryListApp
//
//  Created by Sakir Saiyed on 2025-06-08.
//

import SwiftUI
import SwiftData

@main
struct GroceryListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Item.self)
        }
    }
}
