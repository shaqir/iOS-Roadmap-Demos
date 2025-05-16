import UIKit
 

//In Swift, we can simply use the print() function to print output. For example,

print("Swift is powerful")

// Output: Swift is powerful

//the actual syntax of the print function accepts 3 parameters

//print(items: separator: terminator:)

/*
 items - values inside the double quotation
 separator (optional) - allows us to separate multiple items inside print().
 terminator (optional) - allows us to add add specific values like new line "\n", tab "\t"
 */

print("Good Morning!")
print("It's rainy today")

// print with terminator space

print("Good Morning!", terminator: " ")
print("It's rainy today")

print("New Year", 2022, "See you soon!", separator: ". ")

var number: Double = -10.6

var name: String = "Programiz"

// print literals
print(5)

// print variables
print(number)
print(name)

print("Programming is " + "awesome.")

var year = 2014
print("Swift was introduced in \(year)")

/*
 In Swift, we cannot directly take input from the Xcode playground.

 However, we can create a Command line Tool in Xcode and use the readLine() function to take input from users.

 */
print("Enter your favorite programming language:")
let name1 = readLine()
//print("Your favorite programming language is \(name1!).")

