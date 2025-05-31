//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Sakir Saiyed on 30/05/25.
//

import Foundation

final class NetworkManager{
    
    static let shared = NetworkManager()
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizersURL = baseURL + "appetizers"
    
    private init(){}
    
    // Completion Version
    func getAppetizers(completed: @escaping (Result<[Appetizer], APError>) -> Void){
        
        guard let URL = URL(string: appetizersURL) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: URL)) { data, response, error in
            
            if let _ = error {
                completed(.failure(.unabletoComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                completed(.failure(.unabletoComplete))
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
            
            do{
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
    
    //Async-Await Version using Swift Concurrency
    func getAppetizers() async throws -> [Appetizer] {
        
        let url = URL(string: appetizersURL)!
        
        guard let URL = URL(string: appetizersURL) else {
            throw APError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse else {
            throw APError.unabletoComplete
        }
        
        guard (200...299).contains(response.statusCode) else {
            throw APError.invalidResponse
        }

        let decodedData = try JSONDecoder().decode(AppetizerResponse.self, from: data)
        return decodedData.request
    }
    
}
