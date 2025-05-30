import UIKit

/// Remove Duplicates from an Array

///🎯 Problem:
//Given an array of integers, remove the duplicates and return a new array with unique elements only.

//Solution 1: Using Set (Fast & Simple)

let inputArray1: [Int] = [1, 2, 2, 3, 4, 4, 5]
let uniqueNumberSet = Set(inputArray1)

print(uniqueNumberSet)  //Unordered
print(uniqueNumberSet.sorted()) //Ordered

//🔍 Solution 2: Using Loop to Preserve Order

var expectedOutput1: Set<Int> = []

for num in inputArray1 {
    if !expectedOutput1.contains(num) {
        expectedOutput1.insert(num)
    }
}

print(expectedOutput1)

func removeDuplicatesOrdered(_ array: [Int]) -> [Int] {
    var seen: Set<Int> = []
    var result: [Int] = []
    
    for value in array {
        if !seen.contains(value) {
            seen.insert(value)
            result.append(value)
        }
    }
    return result
}
print(removeDuplicatesOrdered([1,9, 2, 3, 2, 1, 4, 5, 4]))

//🔍 Solution 3: Using reduce(into:)
 

func removeDuplicatesReduce(_ array: [Int]) -> [Int] {
    
    var seen: Set<Int> = []
    return array.reduce(into: []) { result, element in
        if !seen.contains(element){
            seen.insert(element)
            result.append(element)
        }
    }
}

print(removeDuplicatesReduce([1,2, 2, 3, 2,2, 1,1, 4, 5,5, 4]))

// Bonus: Generic Version for Any Hashable Type
 

func removeDuplicatesGeneric<T: Hashable>(_ array: [T]) -> [T] {
    var seen: Set<T> = []
    return array.filter{ seen.insert($0).inserted}
}

 
