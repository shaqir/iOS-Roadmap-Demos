//
//  APIService.swift
//  AlamoFireInSwiftUI
//
//  Created by Sakir Saiyed on 2025-06-11.
//

import Foundation
import Alamofire

class APIService {
    static let shared = APIService()
    private init() {}

    func fetchPosts(completion: @escaping (Result<[Post], AFError>) -> Void) {
        let url = "https://jsonplaceholder.typicode.com/posts"
        AF.request(url)
            .validate()
            .responseDecodable(of: [Post].self) { response in
                completion(response.result)
            }
    }
    
    //Async-Await Version
    func fetchPosts() async throws -> [Post] {
        let url = "https://jsonplaceholder.typicode.com/posts"
        return try await withCheckedThrowingContinuation { continuation in
            AF.request(url)
                .validate()
                .responseDecodable(of: [Post].self) { response in
                    switch response.result {
                    case .success(let posts):
                        continuation.resume(returning: posts)
                    case .failure(let error):
                        continuation.resume(throwing: error)
                    }
                }
        }
    }
}

 
