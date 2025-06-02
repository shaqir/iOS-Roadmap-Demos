//
//  Alert.swift
//  Appetizers
//
//  Created by Sakir Saiyed on 31/05/25.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: String
    let message: String
    let dismissButton: Alert.Button
}

struct AlertContext{
    
    //MARK: - Network Error Alerts
    static let invalidData = AlertItem(title: "Server Error",
                                       message: APError.invalidData.localizedDescription,
                                       dismissButton: .default(Text("OK")))
    
    static let invalidURL = AlertItem(title: "Server Error",
                                      message: APError.invalidURL.localizedDescription,
                                      dismissButton: .default(Text("OK")))
    
    static let invalidResponse = AlertItem(title: "Server Error",
                                           message: APError.invalidResponse.localizedDescription,
                                           dismissButton: .default(Text("OK")))
    
    static let unableToComplete = AlertItem(title: "Server Error",
                                            message: APError.unableToComplete.localizedDescription,
                                            dismissButton: .default(Text("OK")))
    
    static let noInterntConnection = AlertItem(title: "Server Error",
                                               message: APError.noInternetConnection.localizedDescription,
                                               dismissButton: .default(Text("OK")))

    static let unknownError =  AlertItem(title:  "Unexpected Error",
                                         message: "Something went wrong. Please try again.",
                                         dismissButton: .default(Text("OK")))
    
    //MARK: - Account Alerts
    static let inValidForm =  AlertItem(title:  "Invalid Form",
                                         message: "Please ensure all fields are filled correctly.",
                                         dismissButton: .default(Text("OK")))
   
    static let inValidEmail =  AlertItem(title:  "Invalid Email",
                                         message: "Please enter a valid email address.",
                                         dismissButton: .default(Text("OK")))
    
    static let userSaveSucess =  AlertItem(title:  "Profile saved",
                                         message: "User saved successfully.",
                                         dismissButton: .default(Text("OK")))
    
    static let invalidUserData =  AlertItem(title:  "Invalid User Data",
                                         message: "Invalid user data. Please try again.",
                                         dismissButton: .default(Text("OK")))
    
    
    
}
