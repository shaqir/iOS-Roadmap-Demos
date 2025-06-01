//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Sakir Saiyed on 2025-05-31.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    
    @Published var user = User()
    @Published var alertItem: AlertItem?
    
    @AppStorageCodableOptional("user")
    private var userData: User?
    
    var isValidForm: Bool{
        guard !user.firstName.isEmpty, !user.lastName.isEmpty, !user.email.isEmpty else {
            alertItem = AlertContext.inValidForm
            return false
        }
        guard user.email.isValidEmail else{
            alertItem = AlertContext.inValidEmail
            return false
        }
        return true
    }
    
    func saveChanges() {
        guard isValidForm else { return }
        do {
            try _userData.save(user)
            print("Changes saved.")
            alertItem = AlertContext.userSaveSucess
        } catch {
            alertItem = AlertContext.invalidUserData
        }
        print("Changes have been saved successfully.")
    }
    
    func retrieveUserData() {
        guard let _ = userData else { return }
        do {
            user = try _userData.load() ?? User()
            print("Loaded user: \(String(describing: user))")
        } catch {
            print("Error loading user data: \(error)")
        }
    }
}
