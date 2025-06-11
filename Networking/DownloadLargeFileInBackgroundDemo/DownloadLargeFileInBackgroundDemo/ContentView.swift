//
//  ContentView.swift
//  DownloadLargeFileInBackgroundDemo
//
//  Created by Sakir Saiyed on 2025-06-11.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var downloadManager: DownloadManager

    var body: some View {
        VStack(spacing: 20) {
            Text("Background File Download")
                .font(.title)
                .bold()

            ProgressView(value: downloadManager.downloadProgress)
                .progressViewStyle(LinearProgressViewStyle())
                .padding()

            if downloadManager.downloadComplete {
                Text("Download Complete!")
                    .foregroundColor(.green)
                Text(downloadManager.downloadedFilePath)
                    .font(.caption)
                    .multilineTextAlignment(.center)
                    .padding()
            }

            Button(action: {
                if let url = URL(string: "https://download.samplelib.com/mp4/sample-10s.mp4") {
                    downloadManager.startDownload(from: url)
                }
            }) {
                Text("Start Download")
                    .bold()
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
    }
}
