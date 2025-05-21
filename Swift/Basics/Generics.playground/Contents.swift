import UIKit

var greeting = "Hello, Swift Generics"

//Swift Generics allows us to create a single function and class (or any other types) that can be used with different data types.


//Example: Swift Generic Function

// create a generic function
func displayData<T>(data: T) {
print("Generic Function:")
print("Data Passed:", data)
}

// generic function working with String
displayData(data: "Swift")

// generic function working with Int
displayData(data: 5)

//Swift Generic Class

//Similar to the generic function, we can also create a class that can be used with any type of data. Such a class is known as Generic Class.


// create a generic class
class Information<T> {

  // property of T type
  var data: T

  init (data: T) {
    self.data = data
  }

  // method that return T type variable
  func getData() -> T {
    return self.data
  }
}

// initialize generic class with Int data
var intObj = Information<Int>(data: 6)
print("Generic Class returns:", intObj.getData())

// initialize generic class with String data
var strObj = Information<String>(data: "Swift")
print("Generic Class returns:", strObj.getData())

//Type Constraints in Swift Generics

//Note: Numeric is the built-in protocol for numeric values like Int and Double.

//create a generic function with type constraint
func addition<T: Numeric>(num1: T, num2: T) {

  print("Sum:", num1 + num2)
}

// pass Int value
addition(num1: 5, num2: 10)

// pass Double value
addition(num1: 5.5, num2: 10.8)

/*

 Here, the generic function is created with type constraints. This means addition() can only work with data types that conform to Numeric protocol (Int, Double, and so on).
 
*/

//Advantages of Swift Generics


//1. Code Reusability

//2. Used with Collections

// creating a integer type array
var list1: Array<Int> = []

// creating a string type array
var list2: Array<String> = []

