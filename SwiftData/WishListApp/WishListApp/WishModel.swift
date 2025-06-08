//
//  WishModel.swift
//  WishListApp
//
//  Created by Sakir Saiyed on 2025-06-08.
//

import Foundation
import SwiftData

@Model
class Wish{
    var title: String
    
    init(title: String) {
        self.title = title
    }
}
