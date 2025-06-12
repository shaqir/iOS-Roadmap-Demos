import Foundation

class Cart {
    private var items: [String: Int] = [:]

    func addItem(_ name: String, quantity: Int = 1) {
        items[name, default: 0] += quantity
    }

    func removeItem(_ name: String) {
        items.removeValue(forKey: name)
    }

    func itemCount(_ name: String) -> Int {
        return items[name, default: 0]
    }

    func totalItems() -> Int {
        return items.values.reduce(0, +)
    }

    func hasItem(_ name: String) -> Bool {
        return items[name] != nil
    }
}
