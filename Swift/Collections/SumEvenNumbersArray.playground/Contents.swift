import UIKit
import Foundation

///✅ Example : Sum of Even Numbers in an Array

//Problem:
//Write a Swift function that takes an array of integers and returns the sum of all even numbers.


func sumEvenNumbers(_ numbers: [Int]?) -> Int {
    guard let numbers = numbers else {
        return 0 
    }
    
    if numbers.isEmpty {
        return 0 
    }
    
    return numbers.filter { $0.isMultiple(of: 2) }.reduce(0, +)
}


//Write it without using any in-build swift functions

func sumEvenNumbers1(_ numbers: [Int]) -> Int {
    
    var sum: Int = 0
    
    for num in numbers {
        if(num % 2 == 0){
            sum += num
        }
    }
    return sum
}

let numbersArray = Array(1...1_000_00)

let total = sumEvenNumbers(numbersArray)
let total1 = sumEvenNumbers1(numbersArray)

print(" Sum is: \(total) & \(total1)")

// Also, check which function is faster...

func measureTime(_ block: () -> Void) {
    let start = CFAbsoluteTimeGetCurrent()
    block()
    let diff = CFAbsoluteTimeGetCurrent() - start
    print("Time taken: \(diff) seconds")
}

measureTime {
    print("Function 1")
    _ = numbersArray.filter { $0.isMultiple(of: 2) }.reduce(0, +)
}

measureTime {
    print("Function 2")
    var sum = 0
    for number in numbersArray {
        if number % 2 == 0 {
            sum += number
        }
    }
}

/*
Result:
 
Sum is: 2500050000
 
Function 1
Time taken: 0.374609112739563 seconds
 
Function 2
Time taken: 0.1881769895553589 seconds
 
*/

// Conclusion:

/*  Which is Faster?
 
The imperative approach (using for loop) is slightly faster in most cases, especially on large datasets, because:

It avoids creating an intermediate array from filter.

It’s easier for the compiler to optimize loops at a low level.

However, for small to medium arrays, the performance difference is negligible.

*/

