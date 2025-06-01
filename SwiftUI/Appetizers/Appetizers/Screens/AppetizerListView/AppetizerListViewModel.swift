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
    @Published var isLoading: Bool = false
    @Published var isShowingDetail = false
    @Published var selectedAppetizer: Appetizer?
    
    /// Preferred: Async-Await version of fetching appetizers
    func getAppetizers() async {
        isLoading = true
        do {
            appetizers = try await NetworkManager.shared.getAppetizers()
        }
        catch let error as APError{
                
            switch error{
                
            case .invalidData:          alertItem = AlertContext.invalidData
            case .invalidResponse:      alertItem = AlertContext.invalidResponse
            case .invalidURL:           alertItem = AlertContext.invalidURL
            case .unableToComplete:     alertItem = AlertContext.unableToComplete
            case .noInternetConnection: alertItem = AlertContext.noInterntConnection
                
            }
        }
        catch{
            alertItem = AlertContext.unknownError
        }
        isLoading = false
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

