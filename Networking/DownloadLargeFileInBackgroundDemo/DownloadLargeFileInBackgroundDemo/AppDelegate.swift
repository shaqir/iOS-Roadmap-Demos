//
//  AppDelegate.swift
//  DownloadLargeFileInBackgroundDemo
//
//  Created by Sakir Saiyed on 2025-06-11.
//

import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    var backgroundSessionCompletionHandler: (() -> Void)?

    func application(_ application: UIApplication,
                     handleEventsForBackgroundURLSession identifier: String,
                     completionHandler: @escaping () -> Void) {
        backgroundSessionCompletionHandler = completionHandler
    }
}
