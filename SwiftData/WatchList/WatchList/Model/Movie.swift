//
//  Movie.swift
//  WatchList
//
//  Created by Sakir Saiyed on 2025-06-09.
//

import Foundation
import SwiftData

@Model
class Movie{
    var title: String
    var genre: Genre
    
    init(title: String, genre: Genre) {
        self.title = title
        self.genre = genre
    }
}

extension Movie{
    @MainActor
    static var preview: ModelContainer{
        
        let container = try! ModelContainer(for: Movie.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        
        container.mainContext.insert(Movie(title: "John Wick", genre: Genre(rawValue: 1)!))
        container.mainContext.insert(Movie(title: "GroundHog Day", genre: Genre(rawValue: 2)!))
        container.mainContext.insert(Movie(title: "Toy Story", genre: Genre(rawValue: 3)!))
        container.mainContext.insert(Movie(title: "Blade Runner", genre: Genre(rawValue: 4)!))
        container.mainContext.insert(Movie(title: "Troy", genre: Genre(rawValue: 5)!))
        container.mainContext.insert(Movie(title: "Titanic", genre: Genre(rawValue: 6)!))
        container.mainContext.insert(Movie(title: "Intersteller", genre: Genre(rawValue: 7)!))
        container.mainContext.insert(Movie(title: "King Kong", genre: Genre(rawValue: 8)!))
        container.mainContext.insert(Movie(title: "Labyrinth", genre: Genre(rawValue: 9)!))
        
        return container
    
    }
}
