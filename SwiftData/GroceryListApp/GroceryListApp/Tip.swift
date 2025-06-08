//
//  Tip.swift
//  GroceryListApp
//
//  Created by Sakir Saiyed on 2025-06-08.
//

import Foundation
import TipKit

struct ButtonTip: Tip {
    
    var title : Text = Text("Essential Foods")
    var message: Text? = Text("Add everyday items like bread, milk, eggs.")
    var image: Image? = Image(systemName: "info.circle")
    
}
