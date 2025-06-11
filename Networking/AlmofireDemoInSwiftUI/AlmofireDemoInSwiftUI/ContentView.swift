//
//  ContentView.swift
//  AlmofireDemoInSwiftUI
//
//  Created by Sakir Saiyed on 2025-06-11.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = PostViewModel()
    var body: some View {
        NavigationView {
            if viewModel.isLoading {
                ProgressView("Loading posts...")
                    .navigationTitle("Posts")
            } else if let errorMessage = viewModel.errorMessage {
                VStack(spacing: 16) {
                    Text("Error")
                        .font(.title)
                    Text(errorMessage)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.red)
                    Button("Retry") {
                        Task {
                            await viewModel.fetchPostsAsyncAwait()
                        }
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding()
                .navigationTitle("Posts")
            } else {
                List(viewModel.posts) { post in
                    VStack(alignment: .leading) {
                        Text(post.title)
                            .font(.headline)
                        Text(post.body)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding(.vertical, 4)
                }
                .listStyle(.plain)
                .navigationTitle("Posts")
            }
        }
        .task {
            await viewModel.fetchPostsAsyncAwait()
        }
    }
}



#Preview("My App Preview") {
    ContentView()
}
