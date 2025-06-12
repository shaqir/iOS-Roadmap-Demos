//
//  DownloadLargeFileInBackgroundDemoApp.swift
//  DownloadLargeFileInBackgroundDemo
//
//  Created by Sakir Saiyed on 2025-06-11.
//

import SwiftUI

@main
struct DownloadLargeFileInBackgroundDemoApp: App {

    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(DownloadManager.shared)
        }
    }
}
