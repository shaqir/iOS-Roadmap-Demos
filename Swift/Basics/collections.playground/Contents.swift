import UIKit
 

// an array of integer type
var numbers : [Int] = [2, 4, 6, 8]

print("Array: \(numbers)")

var numbs = [2, 4, 6, 8]
print("Array: \(numbs)")   // [2, 4, 6, 8]


//Access an array element

var languages = ["Swift", "Java", "C++"]

// access element at index 0
print(languages[0])   // Swift

// access element at index 2
print(languages[2])   // C++

// Add element

var numbers1 = [21, 34, 54, 12]

print("Before Append: \(numbers1)")

// using append method
numbers1.append(32)

print("After Append: \(numbers1)")

// Add entire array

var primeNumbers = [2, 3, 5]
print("Array1: \(primeNumbers)")

var evenNumbers = [4, 6, 8]
print("Array2: \(evenNumbers)")

// join two arrays
primeNumbers.append(contentsOf: evenNumbers)

print("Array after append: \(primeNumbers)")

primeNumbers.sort()
print("Sorted Array: \(primeNumbers)")

//Insert

var numbers2 = [21, 34, 54, 12]

print("Before Insert: \(numbers2)")

numbers2.insert(32, at: 1)

print("After insert: \(numbers2)")

//Modify the Elements of an Array
var dailyActivities = ["Eat","Repeat"]
print("Initial Array: \(dailyActivities)")

// change element at index 1
dailyActivities[1] = "Sleep"

print("Updated Array:  \(dailyActivities)")
 
//Remove an Element from an Array

var languages2 = ["Swift","Java","Python"]

print("Initial Array: \(languages2)")

// remove element at index 1
let removedValue = languages2.remove(at: 1)

print("Updated Array: \(languages2)")
print("Removed value: \(removedValue)")


//Looping Through Array

// an array of fruits
let fruits = ["Apple", "Peach", "Mango"]

// for loop to iterate over array
for fruit in fruits {
  print(fruit)
}

//Find Number of Array Elements

let evenNumbers1 = [2,4,6,8]
print("Array: \(evenNumbers1)")

// find number of elements
print("Total Elements: \(evenNumbers1.count)")

//Check if an Array is Empty

// array with elements
let numbers3 = [21, 33, 59, 17]
print("Numbers: \(numbers)")

// check if numbers is empty
var  result = numbers3.isEmpty
print("Is numbers empty? : \(result)")

// array without elements
let evenNumbers2 = [Int]()
print("Even Numbers: \(evenNumbers2)")

// check if evenNumbers is empty
result = evenNumbers2.isEmpty
print("Is evenNumbers empty? : \(result)")


//Array With Mixed Data Types

// array with String and integer data
var address: [Any] = ["Scranton", 570]
 
print(address)

// Swift Sets

// create a set of integer type
var studentID : Set = [112, 114, 116, 118, 115]

print("Student ID: \(studentID)")

var student_ID : Set<Int> = [112, 114, 115, 116, 118]
print("Student ID: \(student_ID)")


//Add Elements to a Set
var setnumbers: Set = [21, 34, 54, 12]

print("Initial Set: \(setnumbers)")

// using insert method
setnumbers.insert(32)

print("Updated Set: \(setnumbers)")

//Remove an Element from a Set

var setlanguages: Set = ["Swift", "Java", "Python"]

print("Initial Set: \(setlanguages)")

// remove Java from a set
let setremovedValue = setlanguages.remove("Java")

print("Set after remove(): \(setlanguages)")

//Iterate Over a Set

let setfruits: Set = ["Apple", "Peach", "Mango"]

print("Fruits:")

// for loop to access each fruits
for fruit in setfruits {
  print(fruit)
}
//1. Union of Two Sets
// first set
let setA: Set = [1, 3, 5]
print("Set A: ", setA)

// second set
let setB: Set = [0, 2, 4, 3]
print("Set B: ", setB)

// perform union operation
print("Union: ", setA.union(setB))

//2. Intersection between Two Sets



// perform intersection operation
print("Intersection: ", setA.intersection(setB))

//3. Difference between Two Sets

// perform subtraction operation
print("Subtraction: ", setA.subtracting(setB))

//4. Symmetric Difference between Two Sets


// perform symmetric difference operation
print("Symmetric Difference: ", setA.symmetricDifference(setB))

//5. Check Subset of a Set



// check if setB is subset of setA or not
print("Subset: ", setB.isSubset(of: setA))


let setA1: Set = [1, 3, 5]
let setB1: Set = [3, 5, 1]

if setA1 == setB1 {
  print("Set A and Set B are equal")
}
else {
  print("Set A and Set B are different")
}

//Create an Empty Set

var emptySet = Set<Int>()
print("Set:", emptySet)


//Swift Dictionary


var capitalCity1 = ["Nepal": "Kathmandu", "Italy": "Rome", "England": "London"]
print(capitalCity1)

//// dictionary with keys and values of different data types
var numbers4 = [1: "One", 2: "Two", 3: "Three"]
print(numbers4)

//Add Elements to a Dictionary

var capitalCity = ["Nepal": "Kathmandu", "England": "London"]
print("Initial Dictionary: ",capitalCity)

capitalCity["Japan"] = "Tokyo"

print("Updated Dictionary: ",capitalCity)
print(capitalCity["Japan"]!)

//Change Value of Dictionary

var studentID2 = [111: "Eric", 112: "Kyle", 113: "Butters"]
print("Initial Dictionary: ", studentID2)

studentID2[112] = "Stan"

print("Updated Dictionary: ", studentID2)

//Remove an Element from a Dictionary


var studentID5 = [111: "Eric", 112: "Kyle", 113: "Butters"]

print("Initial Dictionary: ", studentID5)

var removedValue5  = studentID5.removeValue(forKey: 112)

print("Dictionary After removeValue(): ", studentID5)


//Iterate Over a Dictionary
var classification = ["Fruit": "Apple", "Vegetable": "Broccoli", "Beverage": "Milk"]

print("Keys: Values")

for (key,value) in classification {
  print("\(key): \(value)")
}

//Create an Empty Dictionary
var emptyDictionary =  [Int: String]()
print("Empty Dictionary: ",emptyDictionary)

//Swift Tuple
//In Swift, a tuple is a group of different values. And, each value inside a tuple can be of different data types.


var product = ("MacBook", 1099.99)

// access the first element
product.0

// access second element
product.1

// create tuple with two elements
var product1 = ("MacBook", 1099.99)

// access tuple elements
print("Name:", product1.0)
print("Price:", product1.1)

// create tuple with two elements
var product2 = ("MacBook", 1099.99)

print("Original Tuple: ")

// access tuple elements
print("Name:", product2.0)
print("Price:", product2.1)

// modify second value
product2.1 = 1299.99

print("\nTuple After Modification: ")

// access tuple elements
print("Name:", product2.0)
print("Price:", product2.1)


var company2 = (product: "Programiz App", version: 2.1)

// access "Programiz App"
company2.product
//Swift Nested Tuple


var alphabets = ("A", "B", "C", ("a", "b", "c"))

// access first element
print(alphabets.0)   // prints "A"

// access the third element
print(alphabets.3)

// access nested tuple
print(alphabets.3.0)  // prints "a"


var laptopLaunch = ("MacBook", 1299, ["Nepal": "10 PM", "England": "10 AM"])
print(laptopLaunch.2)

laptopLaunch.2["USA"] = "11 AM"

print(laptopLaunch.2)

