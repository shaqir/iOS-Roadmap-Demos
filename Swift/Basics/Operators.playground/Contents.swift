import UIKit
 
/*
 
 Here's a list of different types of Swift operators

 Arithmetic operators
 Assignment Operators
 Comparison Operators
 Logical Operators
 Bitwise Operators
 Other Operators

*/

// 1: Arithmetic Operators in Swift

var a = 7
var b = 2

// addition
print (a + b)

// subtraction
print (a - b)

// multiplication
print (a * b)

// returns quotient only
print(7 / 2) //= 3

// perform division
print(7.0 / 3.0) //  = 2.333


print(9 % 4)  // 1


//2. Swift Assignment Operators

// assign 10 to a
var a2 = 10

// assign 5 to b
var b2 = 5

// assign the sum of a and b to a
a2 += b2      // a = a + b

print(a2)

// 3. Swift Comparison Operators

var a3 = 5, b3 = 2

// equal to operator
print(a3 == b3)

// not equal to operator
print(a3 != b3)

// greater than operator
print(a3 > b3)

// less than operator
print(a3 < b3)

// greater than or equal to operator
print(a3 >= b3)

// less than or equal to operator
print(a3 <= b3)


// 4. Swift Logical Operators

// logical AND
print(true && true)      // true
print(true && false)     // false

// logical OR
print(true || false)      // true

// logical NOT
print(!true)                  // false


// 5. Swift Bitwise Operators
/*
 Operator    Description
 &    Binary AND
 |    Binary OR
 ^    Binary XOR
 ~    Binary One's Complement
 <<    Binary Shift Left
 >>    Binary Shift Right

 */

//6. Other Swift Operators

/*
 
 Operator    Description    Example
 
 ? :    Ternary Operator - returns value based on the condition    (5 > 2) ? "Success" : "Error" // Success
 
 ??    Nil-Coalescing Operator - checks whether an optional contains a value or not    number ?? 5
 
 ...    Range Operator - defines range containing values    1...3 // range containing values 1,2,3

 
 */
