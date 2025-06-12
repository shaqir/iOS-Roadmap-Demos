//
//  Genre.swift
//  WatchList
//
//  Created by Sakir Saiyed on 2025-06-09.
//

import Foundation

enum Genre: Int, Codable, CaseIterable, Identifiable {
    
    var id: Int{
        rawValue
    }
    
    case action = 1
    case adventure = 2
    case animation = 3
    case comedy = 4
    case drama = 5
    case fantasy = 6
    case horror = 7
    case romance = 8
    case scienceFiction = 9
    case thriller = 10
    case western = 11
    case musical = 12
    case kids = 13
}

extension Genre {
    var name: String {
        switch self {
        case .action:
            "Action"
        case .adventure:
            "Adventure"
        case .animation:
            "Animation"
        case .comedy:
            "Comedy"
        case .drama:
            "Drama"
        case .fantasy:
            "Fantasy"
        case .horror:
            "Horror"
        case .romance:
            "Romance"
        case .scienceFiction:
            "Science Fiction"
        case .thriller:
            "Thriller"
        case .western:
            "Western"
        case .musical:
            "Musical"
        case .kids:
            "Kids"
        }
    }
}
