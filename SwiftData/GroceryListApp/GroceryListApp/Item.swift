//
//  Item.swift
//  GroceryListApp
//
//  Created by Sakir Saiyed on 2025-06-08.
//

import Foundation
import SwiftData

@Model
class Item {
    var title: String
    var isCompleted: Bool
    
    init(title: String, isCompleted: Bool = false) {
        self.title = title
        self.isCompleted = isCompleted
    }
}
