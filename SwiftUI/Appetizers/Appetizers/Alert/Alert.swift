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
    let dismissButtonTitle: Alert.Button
}

struct AlertContext{
    
    static let invalidData = AlertItem(title: "Server Error",
                                       message: APError.invalidData.localizedDescription,
                                       dismissButtonTitle: .default(Text("OK")))
    
    static let invalidURL = AlertItem(title: "Server Error",
                                      message: APError.invalidURL.localizedDescription,
                                      dismissButtonTitle: .default(Text("OK")))
    
    static let invalidResponse = AlertItem(title: "Server Error",
                                           message: APError.invalidResponse.localizedDescription,
                                           dismissButtonTitle: .default(Text("OK")))
    
    static let unableToComplete = AlertItem(title: "Server Error",
                                            message: APError.unableToComplete.localizedDescription,
                                            dismissButtonTitle: .default(Text("OK")))
    
    static let noInterntConnection = AlertItem(title: "Server Error",
                                               message: APError.noInternetConnection.localizedDescription,
                                               dismissButtonTitle: .default(Text("OK")))
    
    
    static let unknownError =  AlertItem(title:  "Unexpected Error",
                                         message: "Something went wrong. Please try again.",
                                         dismissButtonTitle: .default(Text("OK")))
    
}
