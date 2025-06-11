//
//  DownloadManager.swift
//  DownloadLargeFileInBackgroundDemo
//
//  Created by Sakir Saiyed on 2025-06-11.
//

import Foundation
import UIKit

final class DownloadManager: NSObject, ObservableObject, URLSessionDownloadDelegate {
    static let shared = DownloadManager()

    @Published var downloadProgress: Double = 0.0
    @Published var downloadComplete: Bool = false
    @Published var downloadedFilePath: String = ""

    private lazy var backgroundSession: URLSession = {
        let config = URLSessionConfiguration.background(withIdentifier: "com.example.download")
        config.isDiscretionary = false
        config.sessionSendsLaunchEvents = true
        return URLSession(configuration: config, delegate: self, delegateQueue: nil)
    }()

    func startDownload(from url: URL) {
        downloadProgress = 0.0
        downloadComplete = false
        downloadedFilePath = ""

        let task = backgroundSession.downloadTask(with: url)
        task.resume()
    }

    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        let fileManager = FileManager.default
        let docsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        let destinationURL = docsURL.appendingPathComponent("DownloadedFile.mp4")

        try? fileManager.removeItem(at: destinationURL)

        do {
            try fileManager.moveItem(at: location, to: destinationURL)
            DispatchQueue.main.async {
                self.downloadedFilePath = destinationURL.path
                self.downloadComplete = true
                print("File saved at: \(self.downloadedFilePath)")
            }
        } catch {
            print("Error saving file: \(error)")
        }
    }

    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        if let error = error {
            print("Download failed: \(error.localizedDescription)")
        } else {
            print("Download completed successfully")
        }
    }

    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask,
                    didWriteData bytesWritten: Int64,
                    totalBytesWritten: Int64,
                    totalBytesExpectedToWrite: Int64) {
        let progress = Double(totalBytesWritten) / Double(totalBytesExpectedToWrite)
        DispatchQueue.main.async {
            self.downloadProgress = progress
        }
    }

    func urlSessionDidFinishEvents(forBackgroundURLSession session: URLSession) {
        DispatchQueue.main.async {
            if let appDelegate = UIApplication.shared.delegate as? AppDelegate,
               let handler = appDelegate.backgroundSessionCompletionHandler {
                handler()
                appDelegate.backgroundSessionCompletionHandler = nil
            }
        }
    }
}
