//
//  User.swift
//  AdvancedAPIClientDemo
//
//  Created by Sakir Saiyed on 2025-06-07.
//

struct User: Codable, Identifiable{
    let id: Int
    let name: String
    let email: String
}
