//
//  WatchListApp.swift
//  WatchList
//
//  Created by Sakir Saiyed on 2025-06-09.
//

import SwiftUI
import SwiftData

@main
struct WatchListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().modelContainer(for: Movie.self)
        }
    }
}
