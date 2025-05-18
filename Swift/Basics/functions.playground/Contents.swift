import UIKit
 

 
// declare a function
func greet() {
  print("Hello World!")
}

// call the function
greet()

print("Outside function")

// function with two parameters
func addNumbers(num1: Int, num2: Int) {
  var sum = num1 + num2
  print("Sum: ",sum)
}

// function with no parameter
func addNumbers() {
  // code
    print("Function with no params.")
}

// function call with two values
addNumbers(num1: 3, num2: 4)

// function call with no value
addNumbers()
 

// function definition
func findSquare (num: Int) -> Int {
  var result = num * num
  return result
}

// function call
var square = findSquare(num: 3)

print("Square:",square)

import Foundation

// sqrt computes the square root
var squareRoot = sqrt(25)

print("Square Root of 25 is",squareRoot)

// pow() comptes the power
var power = pow(2, 3)

print("2 to the power 3 is",power)


func addNumbers2( a: Int = 7,  b: Int = 8) {
  var sum = a + b
  print("Sum:", sum)
}

// function call with two arguments
addNumbers2(a: 2, b: 3)

// function call with one argument
addNumbers2(a: 2)

// function call with no arguments
addNumbers2()


// Omit the argument label
func sum(_ a: Int, _ b: Int) {
  print("Sum:", a + b)
}

sum(2, 3)

//Function with variadic parameters
// program to find sum of multiple numbers

func sumVed( numbers: Int...) {

  var result = 0
  for num in numbers {
    result = result + num
  }
  
  print("Sum = \(result)")
}

// function call with 3 arguments
sumVed(numbers: 1, 2, 3)

// function call with 2 arguments
sumVed (numbers: 4, 9)

//Function With inout Parameters
 

func changeName(name: inout String) {
  if name == "Ross" {
      name = "Joey"
  }
}

var userName = "Ross"
print("Before: ", userName)

changeName(name: &userName)

print("After: ", userName)
//While calling a function with inout parameter, we must use the ampersand(&) sign before a variable name passed as an argument.
//Behind the scenes, an in-out parameter has a value that is passed into the function, is modified by the function, and is passed back out of the function to replace the original value. Therefore the value passed in the function call must be a variable.

//Swift Function Return Values

func compute(number: Int) -> (Int, Int, Int) {

  var square = number * number

  var cube = square * number
  
  return (number, square, cube)
}

var result = compute(number: 5)

print("Number:", result.0)
print("Square:", result.1)
print("Cube:", result.2)

// Swift Nested function

// outer function
func greetMessage() {

  // inner function
  func displayName() {
    print("Good Morning Abraham!")
  }

  // calling inner function
  displayName()
}

// calling outer function
greetMessage()


//Example 2: Nested Function with Parameters


// outer function
func addNumberss() {
  print("Addition")

  // inner function
  func display(num1: Int, num2: Int) {
      print("5 + 10 =", num1 + num2)
  }

  // calling inner function with two values
  display(num1: 5, num2: 10)
}

// calling outer function
addNumberss()

//Nested Function with Return Values


func operate(symbol: String) -> (Int, Int) -> Int {

  // inner function to add two numbers
  func add(num1:Int, num2:Int) -> Int {
    return num1 + num2
  }

  // inner function to subtract two numbers
  func subtract(num1:Int, num2:Int) -> Int {
    return num1 - num2
  }

  let operation = (symbol == "+") ?  add : subtract
  return operation
}

let operation = operate(symbol: "+")
let resultt = operation(8, 3)
print("Result:", resultt)


// Swift Recursion

// program to count down number to 0

func countDown(number: Int) {

  // display the number
  print(number)

  // condition to break recursion
  if number == 0 {
  print("Countdown Stops")
  }

  // condition for recursion call
  else {
  
    // decrease the number value
    countDown(number: number - 1)
  }
}


print("Countdown:")
countDown(number:3)

//Example: Find factorial of a number

func factorial(num: Int) -> Int {

  // condition to break recursion
  if num == 0 {
    return 1
  }
  // condition for recursive call
  else {
    return num * factorial(num: num - 1)
  }
}

var number = 3

// function call
var factResult = factorial(num: number)
print("The factorial of 3 is", factResult)

/*
 Advantages and Disadvantages of Function Recursion
 Below are the advantages and disadvantages of using recursion in Swift programming.

 1. Advantages

 It makes our code shorter and cleaner.
 Recursion is required in problems concerning data structures and advanced algorithms, such as Graph and Tree Traversal.
 2. Disadvantages

 It takes a lot of stack space compared to an iterative program.
 It uses more processor time.
 It can be more difficult to debug compared to an equivalent iterative program.
 */

//Swift Ranges


/*
 
 var numbers = 1...4
 Here,

 ... is a range operator
 1...4 contains values 1, 2, 3, 4
 1 is lower bound (first element)
 4 is upper bound (last element)

 
 */

//1. Closed Range


// 1...4 is close range
for numbers in 1...4 {
  print(numbers)
}

//2. Half-Open Range

for numbers in 1..<4 {
  print(numbers)
}

//3. One-sided Range


// one-sided range using
// ..< operator
let range1 = ..<2
//<2 is a one-sided range. It contains all elements from 2 to -∞.

// check if -9 is in the range
print(range1.contains(-1))

// one-sided range using
// ... operator
let range2 = 2...
//contains all elements from 2 to +∞.

// check if 33 is in the range
print(range2.contains(33))


//Swift Function Overloading


// same function name different arguments
func test() {   }
func test(value: Int) -> Int{ return 0 }
func test(value: String) -> String{  return "" }
func test(value1: Int, value2: Double) -> Double{ return 0.1  }

// function with Int type parameter
func displayValue(value: Int) {
    print("Integer value:", value)
}

// function with String type parameter
func displayValue(value: String) {
    print("String value:", value)
}

// function call with String type parameter
displayValue(value: "Swift")

// function call with Int type parameter
displayValue(value: 2)

//Overloading with Different Number of Parameters

// function with two parameters
func display(number1: Int, number2: Int) {
   print("1st Integer: \(number1) and 2nd Integer: \(number2)")
}

// function with a single parameter
func display(number: Int) {
   print("Integer number: \(number)")
}


// function call with single parameter
display(number: 5)

// function call with two parameters
display(number1: 6, number2: 8)

//Example 3: Function overloading with Argument Label

func display(person1 age:Int) {
    print("Person1 Age:", age)
}

func display(person2 age:Int) {
    print("Person2 Age:", age)
}

display(person1: 25)

display(person2: 38)


//Swift Closures

//In Swift, a closure is a special type of function without the function name. For example,

//Swift Closure Declaration

/*
 
 { (parameters) -> returnType in
    // statements
 }
 
 Here,

 parameters - any value passed to closure
 returnType - specifies the type of value returned by the closure
 in (optional) - used to separate parameters/returnType from closure body

 
 */

var greet1 = {
  print("Hello, World!")
}

// call the closure
greet()

//Closure Parameters

// closure that accepts one parameter
let greetUser = { (name: String)  in
    print("Hey there, \(name).")
}

// closure call
greetUser("Delilah")

//Closure That Returns Value

// closure definition
var findSquare = { (num: Int) -> (Int) in
  var square = num * num
  return square
}

// closure call
var result2 = findSquare(3)

print("Square:",result2)


//Closures as Function Parameter

// define a function
func grabLunch(search: () -> ()) {
  // closure call
  search()
}

/*
 Here,

 search - function parameter
 () -> () - represents the type of the closure
 search() - call closure from the inside of the function.
 
 */

// function call
//grabLunch(search: {
//  print("Alfredo's Pizza: 2 miles away")
//})

//Example: Closure as function parameter

//// define a function and pass closure
//func grabLunch1(search: ()->()) {
//  print("Let's go out for lunch")
//
//  // closure call
//  search()
//}

//// pass closure as a parameter
//grabLunch1(search: {
//   print("Alfredo's Pizza: 2 miles away")
//})


//Trailing Closure
 
func grabLunch(message: String, search: ()->()) {
   print(message)
   search()
}

// use of trailing closure
grabLunch(message:"Let's go out for lunch")  {
  print("Alfredo's Pizza: 2 miles away")
}

/*
 
 Instead of writing this:

  grabLunch(message: "Let's go out for lunch", search: {
   print("Alfredo's Pizza: 2 miles away")
 })
 
 You can write it like this (trailing closure):
 
 grabLunch(message: "Let's go out for lunch") {
   print("Alfredo's Pizza: 2 miles away")
 }
 */


//Autoclosure

//Autoclosure
//While calling a function, we can also pass the closure without using the braces {}.

//Example: Autoclosure

// define a function with automatic closure
func display(greet: @autoclosure () -> ()) {
 greet()
}

// pass closure without {}
display(greet: print("Hello World!"))
