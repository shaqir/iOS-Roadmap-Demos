//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Sakir Saiyed on 2025-05-31.
//

import SwiftUI

final class AccountViewModel: ObservableObject {

    // MARK: - Published State

    @Published var user = User()
    @Published var alertItem: AlertItem?

    // MARK: - Persistence

    @AppStorageCodableOptional("user")
    private var userData: User?

    // MARK: - Validation

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

    // MARK: - Actions

    func saveChanges() {
        guard isValidForm else { return }
        do {
            try _userData.save(user)
            alertItem = AlertContext.userSaveSucess
        } catch {
            alertItem = AlertContext.invalidUserData
        }
    }

    func retrieveUserData() {
        guard let _ = userData else { return }
        do {
            user = try _userData.load() ?? User()
        } catch {
            alertItem = AlertContext.invalidUserData
        }
    }
}
