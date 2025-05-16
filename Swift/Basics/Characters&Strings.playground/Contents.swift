import UIKit

var greeting = "Hello, playground"

 
// create character variable
var letter: Character = "H"
print(letter)  // H

var symbol: Character = "@"
print(symbol)  // @

// create character variable
//let test: Character = "H@" // Error
 

// Error:
// cannot convert value of type 'String' to specified type Character


// create string type variables

let name: String = "Swift"
print(name)

let message = "I love Swift."
print(message)

//String Operations



let str1 = "Hello, world!"
let str2 = "I love Swift."
let str3 = "Hello, world!"

// compare str1 and str2
print(str1 == str2)

// compare str1 and str3
print(str1 == str3)


var greet = "Hello "
var name1 = "Jack"

// using the append() method
greet.append(name1)
print(greet)

var greet1 = "Hello, "
let name2 = "Jack"

// using + operator
var result = greet1 + name2
print(result)

//using =+ operator
greet1 +=  name2
print(greet1)
    
let message1 = "Hello, World!"

// count length of a string
print(message1.count) // 13

//Built-in function    Description

/*
 
isEmpty         determines if a string is empty or not
capitalized     capitalizes the first letter of every word in a string
uppercased()    converts string to uppercase
lowercased()    converts string to lowercase
hasPrefix()     determines if a string starts with certain characters or not
hasSuffix()     determines if a string ends with certain characters or not

*/

// include double quote
//var example = "This is "String" class"
//print(example) // throws error

// use the escape character to solve above issue

var example = "This is \"String\" class"
print(example)

// Output: This is "String" class

/*
Here is a list of all the escape sequences supported by Swift.

Escape Sequences    Character

\0    null
\\    plain backslash
\t    a horizontal tab
\n    line feed
\"    double quote

*/

let name3 = "Swift"

var message2 = "This is \(name3) programming."
print(message2)


// multiline string
var str4: String = """
Swift is awesome
I love Swift
"""

print(str4)

var str = String()
