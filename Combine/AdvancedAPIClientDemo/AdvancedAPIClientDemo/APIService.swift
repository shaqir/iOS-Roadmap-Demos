//
//  APIService.swift
//  AdvancedAPIClientDemo
//
//  Created by Sakir Saiyed on 2025-06-07.
//
import Foundation
import Combine

enum APIError: Error {
    case invalidURL
    case serverError(statusCode: Int)
    case decodingError
    case invalidResponse
    case unknown(Error)
}

protocol URLSessionProtocol {
    func data(for request: URLRequest) async throws -> (Data, URLResponse)
}

extension URLSession: URLSessionProtocol {}

class APIService {
    static let shared = APIService()

    private let session: URLSessionProtocol

    init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }

    func request<T: Decodable>(
        urlString: String,
        method: String = "GET",
        body: Data? = nil,
        responseType: T.Type
    ) async throws -> T {
        guard let url = URL(string: urlString) else {
            throw APIError.invalidURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = method
        if let body = body {
            request.httpBody = body
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }

        let (data, response) = try await session.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse,
              200..<300 ~= httpResponse.statusCode else {
            throw APIError.serverError(statusCode: (response as? HTTPURLResponse)?.statusCode ?? 500)
        }

        return try JSONDecoder().decode(T.self, from: data)
    }

    func requestPublisher<T: Decodable>(
        urlString: String,
        method: String = "GET",
        body: Data? = nil,
        responseType: T.Type
    ) -> AnyPublisher<T, APIError> {
        guard let url = URL(string: urlString) else {
            return Fail(error: .invalidURL).eraseToAnyPublisher()
        }

        var request = URLRequest(url: url)
        request.httpMethod = method
        if let body = body {
            request.httpBody = body
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }

        guard let urlSession = session as? URLSession else {
            return Fail(error: .invalidResponse).eraseToAnyPublisher()
        }

        return urlSession.dataTaskPublisher(for: request)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse,
                      200..<300 ~= httpResponse.statusCode else {
                    throw APIError.invalidResponse
                }
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error in (error as? APIError) ?? .unknown(error) }
            .eraseToAnyPublisher()
    }
}

struct User: Codable {
    let id: Int
    let name: String
    let email: String
}
