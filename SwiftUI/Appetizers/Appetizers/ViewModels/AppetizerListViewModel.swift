//
//  AppetizersViewModel.swift
//  Appetizers
//
//  Created by Sakir Saiyed on 30/05/25.
//
import SwiftUI

@MainActor
final class AppetizerListViewModel: ObservableObject {
        
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?

    /// Preferred: Async-Await version of fetching appetizers
    func getAppetizers() async {
        do {
            appetizers = try await NetworkManager.shared.getAppetizers()
        } catch {
            print("Error fetching appetizers: \(error.localizedDescription)")
            
            switch error as! APError {
            
            case .invalidData: alertItem = AlertContext.invalidData
                
            case .invalidResponse: alertItem = AlertContext.invalidResponse
                
            case .invalidURL: alertItem = AlertContext.invalidURL
                
            case .unabletoComplete: alertItem = AlertContext.unableToComplete
                
            }
        }
    }

    /// Optional: Completion handler version (for compatibility or testing)
    func getAppetizers_() {
        NetworkManager.shared.getAppetizers { result in
            switch result {
            case .success(let appetizers):
                self.appetizers = appetizers
            case .failure(let error):
                print("Error fetching appetizers: \(error.localizedDescription)")
            }
        }
    }
}
