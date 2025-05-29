import UIKit

///✅ Example: Find Maximum and Minimum
///Problem: //Write a function that returns the minimum and maximum from a given array of integers.


//Using Higher-Order Function
func findMinMax1(_ arr: [Int]) -> (max: Int, min: Int){
    return (arr.max() ?? 0, arr.min() ?? 0)
}

//Using Optional and Precise Solution
func findMinMax2(_ numbers: [Int]) -> (min: Int, max: Int)? {
    guard let first = numbers.first else {
        return nil
    }

    var currentMin = first
    var currentMax = first

    for number in numbers {
        if number < currentMin {
            currentMin = number
        } else if number > currentMax {
            currentMax = number
        }
    }

    return (currentMin, currentMax)
}



//Using Variables and Loop
func findMinMax3(_ arr: [Int]) -> (max: Int, min: Int){
    var max = arr[0]
    var min = arr[0]
    for num in arr{
        if(num >= max){
            max = num
        }
        else if(num <= min){
            min = num
        }
    }
    return (max, min)
}

//let smallArray = [11, 22, 3, 4, 555, 16, 1, 18, 9, 10,125,16,12,14,17,7,8,13,20,19]
let largeArray = (1...1_000_000).shuffled()


let result1 = findMinMax1(largeArray)
let result2 = findMinMax2(largeArray)
let result3 = findMinMax3(largeArray)

print("Result1 Min:\(result1.min) Max:\(result1.max)")
print("Result2 Min:\(result2?.min ?? 0) Max:\(result2?.max ?? 0)")
print("Result3 Min:\(result3.min) Max:\(result3.max)")


// to measure time
func measure(_ name: String, block: () -> Void) {
    let start = CFAbsoluteTimeGetCurrent()
    block()
    let end = CFAbsoluteTimeGetCurrent()
    let duration = end - start
    print("\(name): \(String(format: "%.5f", duration)) seconds")
}


// Run Tests
measure("findMinMax1") {
    _ = findMinMax1(largeArray)
}

measure("findMinMax2") {
    _ = findMinMax2(largeArray)
}

measure("findMinMax3") {
    _ = findMinMax3(largeArray)
}

/*
 Times vary based on your device, but generally:

 findMinMax3 will be fastest (no safety checks)

 findMinMax2 close behind (safe + one pass)

 findMinMax1 slowest (2 passes)

 
 🏁 Performance Ranking (Fastest to Slowest):
 Rank    Method     Time Complexity    Notes
 🥇 1    findMinMax2    O(n)        Safe, readable, and efficient
 🥈 2    findMinMax3    O(n)        Fast but unsafe (no empty check)
 🥉 3    findMinMax1    O(2n)       Very readable but double traversal
 */
