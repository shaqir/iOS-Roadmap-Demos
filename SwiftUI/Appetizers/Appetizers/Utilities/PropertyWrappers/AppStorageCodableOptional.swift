//
//  AppStorageCodableOptional.swift
//  Appetizers
//
//  Created by Sakir Saiyed on 2025-05-31.
//
import Foundation
import SwiftUI

@propertyWrapper
struct AppStorageCodableOptional<T: Codable> {
    private let key: String
    private let storage: UserDefaults

    init(_ key: String, store: UserDefaults = .standard) {
        self.key = key
        self.storage = store
    }

    var wrappedValue: T? {
        get {
            try? load()
        }
        set {
            try? save(newValue)
        }
    }

    // Explicit methods to use in ViewModel with error handling
    func save(_ value: T?) throws {
        if let value = value {
            let data = try JSONEncoder().encode(value)
            storage.set(data, forKey: key)
        } else {
            storage.removeObject(forKey: key)
        }
    }

    func load() throws -> T? {
        guard let data = storage.data(forKey: key) else { return nil }
        return try JSONDecoder().decode(T.self, from: data)
    }
}
