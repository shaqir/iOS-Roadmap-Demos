//
//  WishListAppApp.swift
//  WishListApp
//
//  Created by Sakir Saiyed on 2025-06-08.
//

import SwiftUI
import SwiftData

@main
struct WishListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Wish.self)
        }
    }
}
