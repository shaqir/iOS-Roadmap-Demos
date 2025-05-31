import UIKit

//🎯 Find Pairs That Sum to a Given Target
//Problem:
//Given an array of integers and a target sum, return all unique pairs that add up to that target.


/*
 
 let numbers = [2, 4, 3, 5, 6, -1, 1]
 let target = 5

//output
 [(2, 3), (4, 1), (6, -1)]

 */

// Solution 1: Using a Set (Efficient - O(n))
 
func findPairsSumToTarget(_ numbers: [Int], target: Int) -> [(Int,Int)]?{
    
    var seen: Set<Int> = []
    var result: Set<[Int]> = []
    
    for num in numbers {
        let complement = target - num
        if seen.contains(complement) {
            result.insert([min(num, complement), max(num, complement)])
        }
        seen.insert(num)
    }
    return result.map{ ( $0[0], $0[1])}
}
let numbers = [1,2,3,4,5,4,3,2,1]
let target = 5

let output = findPairsSumToTarget(numbers, target: target) ?? []
print("output: \(output)")


// Solution 2: Brute Force (Nested Loop - O(n²))

func findPairWithSumBruteForce(_ numbers: [Int], target: Int) -> [(Int,Int)]? {

    var result: Set<[Int]> = []
    
    for i in 0..<numbers.count {
        for j in i+1..<numbers.count {
            print("i:\(i) : j:\(j) => (\(numbers[i]) : \(numbers[j]))")
            let sum = numbers[i] + numbers[j]
            if sum == target {
                result.insert([min(numbers[i], numbers[j]), max(numbers[i], numbers[j])])
            }
        }
    }
    return result.map { ( $0[0], $0[1])}
}

let numbers2 = [2, 4, 3, 5, 6, -1, 1]
let target2 = 5
let output2 = findPairWithSumBruteForce(numbers2, target: target2) ?? []
print("Final Output: \(output2)")


// Comparing With vs Without min/max
let numbers3 = [1, 2, 3, 4]
let target3 = 5

var resultWithoutMinMax: Set<[Int]> = []
var resultWithMinMax: Set<[Int]> = []

for num in numbers3 {
    let complement = target3 - num
    
    // No normalization (may lead to duplicates)
    if numbers3.contains(complement), num != complement {
        resultWithoutMinMax.insert([num, complement])
    }

    // With min/max to normalize order
    if numbers3.contains(complement), num != complement {
        resultWithMinMax.insert([min(num, complement), max(num, complement)])
    }
}

print(" Without min/max:")
for pair in resultWithoutMinMax {
    print(pair)
}

print("\n With min/max:")
for pair in resultWithMinMax {
    print(pair)
}
