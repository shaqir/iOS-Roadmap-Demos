import UIKit
import Foundation

//🎯 Problem:
//Given an array, count how many times each element appears.

/*
 Input:
 let numbers = [1, 2, 2, 3, 1, 4, 2]

 Output: [
1: 2,
2: 3,
3: 1,
4: 1
]
*/


func countElements(_ numbers: [Int]) -> [Int: Int]{
    
    var counts: [Int: Int] = [:]
    
    for num in numbers {
        if let count = counts[num] {
            counts[num] = count + 1
        } else {
            counts[num] = 1
        }
    }
    return counts
}

print(countElements( [1, 2, 2, 3, 1, 4, 2] ))


// Solution 2: Using a Dictionary
 

func countOccurrences<T: Hashable>(in inputArray: [T]) -> [T: Int] {
    
    var frequency: [T: Int] = [:]
    
    for element in inputArray{
        frequency[element , default: 0] += 1
    }
    return frequency
}
let result = countOccurrences(in: [1,2,3,1,2,3,4,2,1,3, 4])
print("result:")
print(result)


// Solution 3 for any Hashable values like String, Int and double to be part of array.


func countOccurrencesForAnyType(in inputArray: [AnyHashable]) -> [AnyHashable: Int] {
   
   var frequency: [AnyHashable: Int] = [:]
   
   for element in inputArray{
       frequency[element , default: 0] += 1
   }
   return frequency
}
let result1 = countOccurrencesForAnyType(in: ["hi", "hello", 1, "hi", 2, "hi", "hello", 1])
print("result1:")
for (key, value) in result1 {
   print("\(key): \(value)")
}


// ✅ Solution 4: Using reduce(into:) (Functional Style)
 

func countOccurrences4(in array: [Int]?) -> [Int: Int] {
    guard let array = array else {
        return [:]
    }
    return array.reduce(into: [:]) { result, element in
        result[element, default: 0] += 1
    }
}
print("Solution 4: Using reduce(into:)")
print(countOccurrences4(in: [1,2, 2, 3, 1, 2, 3, 4, 2, 1, 3, 4] ))
print(countOccurrences4(in: nil))


// ✅ Solution 5: Using NSCountedSet (Object-Oriented / Foundation)
 
func countUsingNSCountedSet<T: Hashable>(_ array: [T]) -> [T: Int] {
    let countedSet = NSCountedSet(array: array)
    var result: [T: Int] = [:]

    for element in countedSet {
        if let element = element as? T {
            result[element] = countedSet.count(for: element)
        }
    }
    return result
}

print(countUsingNSCountedSet([1,2, 2, 3, 1, 2, 3, 4, 2, 1, 3, 4]))


