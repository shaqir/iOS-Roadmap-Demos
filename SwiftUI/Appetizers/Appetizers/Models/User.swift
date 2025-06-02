//
//  User.swift
//  Appetizers
//
//  Created by Sakir Saiyed on 2025-05-31.
//

import Foundation

struct User: Codable {
    var firstName = ""
    var lastName =  ""
    var birthday: Date = Date()
    var email = ""
    var extraNapkins = false
    var frequentRefills = false
}
