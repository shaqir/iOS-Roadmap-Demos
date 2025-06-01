//
//  APError.swift
//  Appetizers
//
//  Created by Sakir Saiyed on 30/05/25.
//

import Foundation

enum APError: Error, LocalizedError {
    case invalidURL
    case invalidResponse
    case noInternetConnection
    case unableToComplete
    case invalidData

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "The URL is invalid."
        case .invalidResponse:
            return "The server response was invalid."
        case .noInternetConnection:
            return "You appear to be offline. Please check your internet connection."
        case .unableToComplete:
            return "Unable to complete your request. Please try again."
        case .invalidData:
            return "The data received from the server was invalid."
        }
    }
}
