//
//  Appetizer.swift
//  Appetizers
//
//  Created by Sakir Saiyed on 30/05/25.
//

import Foundation

struct Appetizer: Decodable{
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let carbs: Int
    let protein: Int
    let calories: Int
}

struct AppetizerResponse: Decodable{
    let request : [Appetizer]
}

struct MockData{
    
    static let sampleAppetizers : [Appetizer] = [
        .init(id: 1,
              name: "Bacon",
              description: "Crispy bacon, its so yummy.",
              price: 2.99, imageURL: "https://via.placeholder.com/150",
              carbs: 10,
              protein: 27,
              calories: 250),
        .init(id: 2,
              name: "Chicken Wings 2",
              description: "Spicy chicken wings",
              price:  4.99,
              imageURL: "https://via.placeholder.com/150",
              carbs: 30,
              protein: 25,
              calories: 350),
        .init(id: 3,
              name: "Chicken Wings 3",
              description: "Spicy chicken wings",
              price:  4.99,
              imageURL: "https://via.placeholder.com/150",
              carbs: 30,
              protein: 25,
              calories: 350),
        .init(id: 4,
              name: "Chicken Wings 4",
              description: "Spicy chicken wings",
              price:  4.99,
              imageURL: "https://via.placeholder.com/150",
              carbs: 30,
              protein: 25,
              calories: 350),
    ]
    
    static let sampleAppetizerResponse : AppetizerResponse = .init(request: sampleAppetizers)
}
