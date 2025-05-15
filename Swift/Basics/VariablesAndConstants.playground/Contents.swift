import UIKit

// Swift "Hello, World!" Program

print("Hello, World!")


// Declare Variables in Swift

var siteName:String // Only String Values
var id: Int         // Only Int Values

// Assign Values to Variables

siteName = "myswiftworld.com"

print(siteName)


// Direct assignment without Type

var siteNewName = "myswiftworld.com"
print(siteNewName) // myswiftworld.com

// assigning a new value to siteName
siteNewName = "apple.com"
print(siteNewName)


// Rules for naming Swift Variables

// valid
var a = "hello"
var _a = "hello"
var a_ = "hello"

// invalid
//var 1a = "hello" // throws error
//Variable names cannot start with numbers. For example,

//Swift is case-sensitive.

var B = 5
var b = 55
print() // 5
print(b) // 55

// Rules
// Avoid using Swift keywords like var, String, class, etc. as variable names.



/// 2. Swift Constants

let c = 5
print(c)

// In Swift, we use the let keyword to declare constants.

let x = 5
//x = 10      // Error
print(x)


let site: String
//print(site) // Error: constant 'site' used before being initialized


// 3. Swift Literals

/**
 Literals are representations of fixed values in a program. They can be numbers, characters, or strings, etc. For example, "Hello, World!", 12, 23.0, "C", etc.

 Literals are often used to assign values to variables or constants.
 **/


let mySiteName = "Apple.com"

//In the above expression, mySiteName is a variable, and "Apple.com" is a literal.

//Floating-point Literals

let piValue: Float = 3.14
print(piValue)

//Boolean Literals
let pass: Bool = true

//String and Character Literals
let someCharacter: Character = "S"

let someString: String = "Swift is fun"




let name = "Sakir"
var age = 35
age += 1
print("Hello, my name is \(name) and I am \(age) years old.")

