import XCTest
@testable import Cart_XCTest

final class CartTests: XCTestCase {

    var cart: Cart!

    override func setUp() {
        super.setUp()
        cart = Cart()
    }

    func testAddItem() {
        cart.addItem("Apple", quantity: 3)
        XCTAssertEqual(cart.itemCount("Apple"), 3)
    }

    func testRemoveItem() {
        cart.addItem("Banana", quantity: 2)
        cart.removeItem("Banana")
        XCTAssertFalse(cart.hasItem("Banana"))
    }

    func testTotalItems() {
        cart.addItem("Mango", quantity: 2)
        cart.addItem("Orange", quantity: 3)
        XCTAssertEqual(cart.totalItems(), 5)
    }

    func testItemCountForNonExistingItem() {
        XCTAssertEqual(cart.itemCount("Pineapple"), 0)
    }
}
