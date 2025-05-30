import UIKit

///Find the Most Frequent Element in an Array
// Problem:
// Given an array of elements, find the one that occurs most frequently.


let numbers = [1, 3, 1, 3, 2, 1,2,3,4,4,1,5,1,1,2,3,4,5,6,1]

func findMostFrequentElement(_ array: [Int]) -> (number: Int?, count: Int?){
    
    var frequencyDictionary: [Int: Int] = [:]
    for item in array{
        frequencyDictionary[item, default: 0] += 1
    }
    let maxItem = frequencyDictionary.max { $0.value < $1.value }
    return (maxItem?.key, maxItem?.value)
}

let result = findMostFrequentElement(numbers)

print("\(result.number ?? 0) occurred most frequently which is: \(result.count ?? 0) times")

//⚖️ Handling Ties — What if Two Elements Have the Same Frequency?
// ✅ Return all tied elements with highest frequency:
//Using Filter

func findmostfrequentElementWithTies(_ array: [Int]) -> [Int] {
    guard !array.isEmpty else {
        return []
    }
    
    let counts = array.reduce(into: [:]) { counts, element in
        counts[element, default: 0] += 1
    }
    
    guard let maxCount = counts.values.max() else {
        return []
    }
    return counts
        .filter { $1 == maxCount }
        .keys
        .sorted()
}
let numbers1 = [1, 3, 3, 2, 1,2,3,4,4,1,4]
print(findmostfrequentElementWithTies(numbers1))

// Using Filter with Ties
func mostRepeatedElementWithTies<T: Hashable>(_ array: [T]?) -> (element: [T]?, counts: Int?){
    
    var counts: [T: Int] = [:]
    
    guard let array = array  else {
        return (nil, nil)
    }
    
    if array.isEmpty {
        return (nil, nil)
    }
    
    for item in array{
        counts[item, default: 0] += 1
    }
    
    var maxCount = counts.values.max() ?? 0
    let elements = counts.filter { $0.value == maxCount }.map { $0.key }
    
    return(elements, maxCount)
}


let result2 = mostRepeatedElementWithTies(["a", "b", "a", "c", "b","a", "b","a", "b"])
print("Most frequent elements: \(result2.0 ?? []), repeated \(result2.1 ?? 0) times")


// Lets use .reduce function

func mostfrequentwithTiesUsingReduce<T: Hashable>(_ array: [T]?) -> (elements: [T]?, count: Int? ){
    
    guard let array = array else {
        return (nil, nil)
    }
    
    if array.isEmpty {
        return (nil, nil)
    }
    
    let counts = array.reduce(into: [:]) { (dict: inout [T: Int], element) in
        dict[element, default: 0] += 1
    }
    
    let maxCounts = counts.values.max() ?? 0
    
    print(maxCounts)
    
    let elements = counts.reduce(into : [T]()) { (result, pair) in
        if pair.value == maxCounts {
            result.append(pair.key)
        }
    }
    return (elements, maxCounts)
}

let result3 = mostfrequentwithTiesUsingReduce(["a", "b", "a","a", "b","a", "b"])
print(result3.elements ?? [])
print(result3.count ?? 0)


// Using Reduce for most frequent element

func findmostfrequentElement<T: Hashable>(_ array: [T]?) -> (element: T, count: Int)? {
    
    guard let array = array, !array.isEmpty else {
        return nil
    }
    
    let counts = array.reduce(into: [:]){ (result: inout [T : Int], element ) in
        result[element, default: 0] += 1
    }
    
    return counts.reduce(into: nil as (element: T, count: Int)?){ (result, pair) in
        
        if let current = result {
            if pair.value > current.count {
                result = (pair.key, pair.value)
            }
        }
        else{
            result = (pair.key, pair.value)
        }
    }
    
}

let result4 = findmostfrequentElement(["a", "b", "a", nil,"a", "b"])

print("Result4")
print(result4!.count)
print(result4!.element!)
