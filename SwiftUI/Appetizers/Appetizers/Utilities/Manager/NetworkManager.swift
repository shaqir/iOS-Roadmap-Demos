//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Sakir Saiyed on 30/05/25.
//

import Foundation
import UIKit

// MARK: - Protocol (enables DI and testing)

protocol NetworkManagerProtocol {
    func getAppetizers(completed: @escaping (Result<[Appetizer], APError>) -> Void)
    func getAppetizers() async throws -> [Appetizer]
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void)
}

// MARK: - Implementation

final class NetworkManager: NetworkManagerProtocol {

    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()

    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizersURL = baseURL + "appetizers"

    private init() {}

    // MARK: - Completion Handler

    func getAppetizers(completed: @escaping (Result<[Appetizer], APError>) -> Void) {

        guard let URL = URL(string: appetizersURL) else {
            completed(.failure(.invalidURL))
            return
        }

        let task = URLSession.shared.dataTask(with: URLRequest(url: URL)) { data, response, error in

            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }

            guard let response = response as? HTTPURLResponse else {
                completed(.failure(.unableToComplete))
                return
            }

            guard (200...299).contains(response.statusCode) else {
                completed(.failure(.invalidResponse))
                return
            }

            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }

            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
                completed(.success(decodedResponse.request))
            }
            catch {
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }

    // MARK: - Async/Await

    func getAppetizers() async throws -> [Appetizer] {

        guard let URL = URL(string: appetizersURL) else {
            throw APError.invalidURL
        }

        do {
            let (data, response) = try await URLSession.shared.data(from: URL)

            guard let response = response as? HTTPURLResponse else {
                throw APError.unableToComplete
            }

            guard (200...299).contains(response.statusCode) else {
                throw APError.invalidResponse
            }

            let decodedData = try JSONDecoder().decode(AppetizerResponse.self, from: data)
            return decodedData.request
        }
        catch {
            if let urlError = error as? URLError, urlError.code == .notConnectedToInternet {
                throw APError.noInternetConnection
            } else {
                throw APError.unableToComplete
            }
        }
    }

    // MARK: - Image Downloading

    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void) {

        let cacheKey = NSString(string: urlString)

        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }

        guard let url = URL(string: urlString) else {
            return completed(nil)
        }

        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in

            guard let data = data, let image = UIImage(data: data) else {
                return completed(nil)
            }
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        task.resume()
    }
}
