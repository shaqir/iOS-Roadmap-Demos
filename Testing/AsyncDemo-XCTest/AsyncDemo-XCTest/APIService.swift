//
//  APIService.swift
//  AsyncDemo-XCTest
//
//  Created by Sakir Saiyed on 2025-06-12.
//

import Foundation
 
struct Post: Decodable, Identifiable, Equatable {
    let id: Int
    let title: String
    let body: String
}

protocol PostService {
    func fetchPost() async throws -> Post
}

class RealPostService: PostService {
    func fetchPost() async throws -> Post {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(Post.self, from: data)
    }
}
