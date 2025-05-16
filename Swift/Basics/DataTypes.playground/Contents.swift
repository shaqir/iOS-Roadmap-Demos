import UIKit

var greeting = "Hello, playground"

/*
Data Types    Example        Description
 
Character    "s","a"            a 16-bit Unicode character

String       "hello world!"    represents textual data

Int           3, -23            an integer number
 
Float         2.4, 3.14, -23.21    represents 32-bit floating-point number
 
Double        2.422342412414    represents 64-bit floating-point number
 
Bool          true and false    Any of two values: true or false
*/


// create character type variable
var letter: Character = "s"

print(letter)

// Output: s


// create string type variable
var language: String = "swift"

print(language)

// Output: swift


// create integer type variable
var number: Int = 3

print(number)

// Output: 3

//  integers in swift programming.
//  Size: Depends on the platform type
//  Range: -231 to 231-1 (32 bit platform)
//  -263 to 263-1 (64-bit platform)

/*
 
 Swift programming provides different variants of Int type having different sizes.

 Variant    Size    Range
 Int8      8 bit    -128 to 127
 Int16    16 bit    -215 to 215-1
 Int32    32 bit    -231 to 231-1
 Int64    64 bit    -263 to 263-1
 UInt     Depends on platform 0 to 232(32-bit platform) 0 to 264(64-bit platform)
 
*/

// create boolean type variable

let passCheck: Bool = true
print(passCheck)

let failCheck: Bool = false
print(failCheck)

// create float type variable

let piValue: Float = 3.14
print(piValue)

// Output: 3.14

// create double type variable
let latitude: Double = 27.7007697012432

print(latitude)

// Output: 27.7007697012432

// double in swift programming:

// Size: 64-bit floating-point number

// Range: 2.3 x 10-308 to 1.7 x 10308 (Up to 15 decimal places)


