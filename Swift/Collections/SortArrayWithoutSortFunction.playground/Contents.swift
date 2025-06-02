import UIKit

//📐 Sort an Array Without Using .sort()
// Problem:
//Given an array of numbers, sort it in ascending order without using the built-in .sort() or .sorted() methods.


func sortArrayWithoutSortMethod(_ array: [Int]) -> [Int] {
    var sortedArray = array
    for i in 0..<sortedArray.count {
        print("i: \(i)")
        for j in 0..<(sortedArray.count - i - 1) {
            print("j loop: \(sortedArray.count - i - 1)")
            print("j: \(j)")
            if sortedArray[j] > sortedArray[j + 1] {
                print("sortedArray[j]: \(sortedArray[j])")
                print("sortedArray[j+1]: \(sortedArray[j+1])")
                sortedArray.swapAt(j, j + 1)
            }
        }
    }
    return sortedArray
}

print("Sorted Array:")
//print(sortArrayWithoutSortMethod([69, 24, 33, 2, 43, 11, 58, 72]))


// Bubble Sort
//Solution : Bubble Sort (Simple, Intuitive)
 
func bubbleSort(_ array: inout [Int]) {
    let n = array.count
    guard n > 1 else { return }

    for i in 0..<n {
        for j in 0..<n - i - 1 {
            if array[j] > array[j + 1] {
                array.swapAt(j, j + 1)
                print(array)
            }
        }
    }
}
print("Bubble Sort:")
var nums1 = [5, 2, 8, 1, 3]
bubbleSort(&nums1)
print("Bubble Sort result: \(nums1)")
 
/*
Loop Representation:

  j
i
0 0 1 2 3 4 5 6 7 8
1 0 1 2 3 4 5 6 7
2 0 1 2 3 4 5 6
3 0 1 2 3 4 5
4 0 1 2 3 4
5 0 1 2 3
6 0 1 2
7 0 1
8 0

 */
