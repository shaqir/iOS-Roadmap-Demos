//
//  PawsApp.swift
//  Paws
//
//  Created by Sakir Saiyed on 2025-06-08.
//

import SwiftUI
import SwiftData

@main
struct PawsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Pet.self)
        }
    }
}
