//
//  String+Extenstion.swift
//  Appetizers
//
//  Created by Sakir Saiyed on 2025-05-31.
//

import Foundation

extension String{
    
    var isValidEmail: Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return self.range(of: emailRegex, options: .regularExpression, range: nil, locale: nil) != nil
    }
    
}
