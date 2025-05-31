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
                                       message: "The data was invalid, please contact support",
                                       dismissButtonTitle: .default(Text("OK")))
    
    static let invalidURL = AlertItem(title: "Server Error",
                                      message: "Could not connect to server",
                                      dismissButtonTitle: .default(Text("OK")))
    
    static let invalidResponse = AlertItem(title: "Server Error",
                                           message: "Invalid response from server",
                                           dismissButtonTitle: .default(Text("OK")))
    
    static let unableToComplete = AlertItem(title: "Server Error",
                                            message: "Unable to Complete your request at this time",
                                            dismissButtonTitle: .default(Text("OK")))
    
}
