import UIKit
 
//An error (exception) is an unexpected event that occurs during program execution.

//Steps For Error Handling in Swift

/*

 1. Create an enum that represents the types of errors.
 
 2. Create a throwing function using the throws keyword.
 
 3. Call the function using the try keyword.
 
 4. Wrap the code with try in the do {...} block and add the catch {...} block to handle all errors.

*/

//1. Create enum of Errors

//enum DivisionError: Error {
//  case dividedByZero
//}

//2. Create a Throwing Function

// create throwing function using throws keyword
//func division(numerator: Int, denominator: Int) throws {

// throw error if divide by 0
  
  
    /*
     if denominator == 0 {
       throw DivisionError.dividedByZero
     }
     
     The throw keyword has the same effect as the return keyword. return returns some value from the function, whereas throw returns error value from the function.
    */
//}

//3. Function Call Using try Keyword

// call throwing function using try keyword
//try division(numerator: 10, denominator: 0)

//4. Handling Errors Using do-catch Statement
/*
do {
  try division(numerator: 10, denominator: 0)
}
catch DivisionError.dividedByZero {
  // statement
}
 */



// create an enum with error values
enum DivisionError: Error {

  case dividedByZero
}

// create a throwing function using throws keyword
func division(numerator: Int, denominator: Int) throws {

  // throw error if divide by 0
  if denominator == 0 {
    throw DivisionError.dividedByZero
  }
  else {
    let result = numerator / denominator
    print(result)
  }
}

// call throwing function from do block
do {
  try division(numerator: 10, denominator: 0)
  print("Valid Division")
}

// catch error if function throws an error
catch DivisionError.dividedByZero {
  print("Error: Denominator cannot be 0")
}

//Disable Error Handling

try! division(numerator: 10, denominator: 5)

//Also notice that when we use try!, we don't need to use the do-catch statement.
//Note: If we use try! and there is an error, our app will simply crash.

/*
 Causes of Error in Swift
 An error can occur for many reasons. Some of them are:

 Invalid user input
 Device failure
 Loss of network connection
 Physical limitations (out of disk memory)
 Code errors
 Opening an unavailable file
 
 */


