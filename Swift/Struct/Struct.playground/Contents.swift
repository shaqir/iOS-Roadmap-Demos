import UIKit

var greeting = "Hello, Struct"

//A struct is a value type used to group related properties and behaviors. It's like designing a template for an object
//— for example, a User, Book, or Point.

//✅ Step 1: Create & Use a Struct
 
struct User {
    var name: String
    var age: Int
}

let user = User(name: "Alice", age: 30)
print("User 1 Name: \(user.name)")
print("User 1 Age: \(user.age)")


//✅ Step 2: Add a Method
struct User1 {
    var name: String
    var age: Int
    
    func greet() {
        print("Hi, I'm \(name) and I'm \(age).")
    }
}

let user1 = User1(name: "Sakir", age: 35)
user1.greet() // "Hi, I'm Sakir and I'm 35."


//✅ Step 3: Mutating Method


//By default, methods can’t modify properties inside a struct because structs are value types. To change properties, use the mutating keyword:



struct Counter {
    var count: Int = 0
    mutating func increment() {
        count += 1
    }
}
var counter = Counter()
counter.increment()
print("Counter: \(counter.count)") 


//✅ Step 4: Computed Properties
 
struct Rectangle {
    
    var width: Double
    var height: Double
    
    var area: Double{
        return width * height
    }
}

let rect = Rectangle(width: 10, height: 20)
print("Area: \(rect.area)")

//✅ Step 5: Custom Initializers
 
struct User2 {
    
    var name: String
    var isAdmin: Bool
    init(name: String, isAdmin: Bool) {
        self.name = name
        self.isAdmin = isAdmin
    }
}

let user2 = User2(name: "Sakir", isAdmin: true)
print("User 2 Name: \(user2.name)")
print("User 2 is Admin: \(user2.isAdmin)")


//🧙‍♂️ Bonus Challenge: Bank Account with Deposit and Withdraw
 

struct BankAccount {
    
    var bankBalance: Double = 0
    
    mutating func deposit(_ amount: Double) {
        bankBalance += amount
    }
    
    mutating func withdraw(_ amount: Double) {
        guard amount <= bankBalance else {
            print("Insufficient balance.")
            return
        }
        bankBalance = bankBalance - amount
    }
    
    func showBalance(){
        print("BankBalance: $\(bankBalance)")
    }
    
}
var account = BankAccount()
account.deposit(100)
account.withdraw(40)
account.showBalance()  // Balance: $60.0
