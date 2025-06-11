//
//  PostViewModel.swift
//  AlmofireDemoInSwiftUI
//
//  Created by Sakir Saiyed on 2025-06-11.
//

import Foundation
import Alamofire

@MainActor
class PostViewModel: ObservableObject {
    @Published var posts: [Post] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    func fetchPostsClosure() {
        isLoading = true
        errorMessage = nil
        
        //MARK: - closure version
    APIService.shared.fetchPosts { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let posts):
                    self?.posts = posts
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
    //MARK: - Async-await version
    func fetchPostsAsyncAwait() async {
        isLoading = true
        errorMessage = nil
        do {
            let fetchedPosts = try await APIService.shared.fetchPosts()
            posts = fetchedPosts
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
    
}

