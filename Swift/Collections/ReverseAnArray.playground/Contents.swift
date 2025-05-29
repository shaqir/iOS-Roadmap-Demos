import UIKit

///🎯 Challenge: Reverse an Array of Integers

var numbers = [1, 2, 3, 4, 5]

//✅ Solution 1: Using Built-in .reversed()

let reversednumbers = Array(numbers.reversed())
print(reversednumbers)



//✅ Solution 2: In-place Reversal (Mutating the Original Array)

func reverseArrayInPlace(_ array: inout [Int]) -> [Int]{
    var startIndex = 0
    var endIndex = array.count - 1
    
    while startIndex < endIndex {
        let temp = array[startIndex]
        array[startIndex] = array[endIndex]
        array[endIndex] = temp
        startIndex += 1
        endIndex -= 1
    }
    return array
}

var numbers2 = [1, 2, 3, 4, 5]
let reveredNumbers2 = reverseArrayInPlace(&numbers2)
print(reveredNumbers2)
 

//✅ Solution 3: Manual Reversal Using Loop

func reverseArrayManually(_ array: [Int]) -> [Int]
{
    var reversedArray: [Int] = []
    for num in array{
        reversedArray.insert(num, at: 0)
    }
    return reversedArray
}

var numbers3 = [1, 2, 3, 4, 5]
print(reverseArrayManually(numbers3))



//✅ Solution 4: Two-pointer Swap (Efficient In-place)
 
func reverseInPlace(_ arr: inout [Int]) {
    var left = 0
    var right = arr.count - 1

    while left < right {
        arr.swapAt(left, right)
        left += 1
        right -= 1
    }
}


var numbers4 = [1, 2, 3, 4, 5]
reverseInPlace(&numbers4)
print(numbers4) // [5, 4, 3, 2, 1]


//✅ Solution 5: Using reduce() (Functional Programming)

let numbers5 = [1, 2, 3, 4, 5]
let reversed5 = numbers5.reduce([]) {
    (result: [Int], element: Int) in
    [element] + result
}
print(reversed5) // [5, 4, 3, 2, 1]


//✅ Solution 6: Recursion (Educational, Not Practical for Large Arrays)
 

func reverseRecursive<T>(_ array: [T]) -> [T] {
    
    print(array)
    guard let first = array.first else {
        print("now return")
        return []
    }
    print(first)
    return reverseRecursive(Array(array.dropFirst())) + [first]
}

print(reverseRecursive([1, 2, 3, 4, 5])) // [5, 4, 3, 2, 1]
//Inefficient & risky for large arrays (stack overflow).
//Time: O(n²), Space: O(n)

//✅ Solution 7: Using stride(from:to:by:) for Index Reversal
 
let numbers7 = [1, 2, 3, 4, 5]
let reversed7 = stride(from: numbers7.count - 1, through: 0, by: -1).map { numbers7[$0] }
print(reversed7) // [5, 4, 3, 2, 1]


/*
 conclusion
 
 #imageLiteral(resourceName: "Screenshot 2025-05-28 at 11.39.28 PM.png")
 
 ✅ Recommendation
 For real-world use:

 Use .reversed() + Array() if you're fine with a new array.

 Use reverse() or swapAt if you want to modify the original array.

 
*/
