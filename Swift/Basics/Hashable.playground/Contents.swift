import UIKit

var greeting = "Hello, Hashable"

//In Swift, a Hashable is a protocol that provides a hashValue to our object. The hashValue is used to compare two instances.


//Example: Swift Hashable Protocol

struct EmployeeA: Hashable {
  var name: String
}

let object1 = EmployeeA(name: "Sabby")
let object2 = EmployeeA(name: "Smith")

// print hash values
print(object1.hashValue)
print(object2.hashValue)

//Note: A hash value is a long integer that varies based on the system you are using, so you might get different values for the same code.

//Compare Instances using Hashable Protocol


// conform Employee to Hashable
struct Employee: Hashable {
    
    var name: String
    var salary: Int
}

// initialize two objects with different property values
let obj1 = Employee(name: "Sabby", salary: 40000)
let obj2 = Employee(name: "Cathy", salary: 30000)

print("Different hash value: ")
print(obj1.hashValue)
print(obj2.hashValue)

// initialize two objects with same property values
let obj3 = Employee(name: "Lanny", salary: 50000)
let obj4 = Employee(name: "Lanny", salary: 50000)

print("\nSame hash value: ")
print(obj3.hashValue)
print(obj4.hashValue)

//Hash Function and Combine

/*
 In the above example, we have compared all the properties of the struct.

 However, sometimes we may want to compare selective properties of the type. In this case, we may use the hash function inside the type. For example,

 */


struct EmployeeHash: Hashable {
  
 var name: String
 var salary: Int
 var age: Int
    

 // create a hash() function to only compare  age property
 func hash(into hasher: inout Hasher) {
    //hasher.combine(salary)//we can use multiple properties inside this function
    hasher.combine(age)
 }

}

// initialize two objects with different values for salary property
let objHash1 = EmployeeHash(name: "Sabby", salary: 349879, age: 51)
let objHash2 = EmployeeHash(name: "Sabby", salary: 349879, age: 5)

print("Lets check it out!")
print(objHash1.hashValue)
print(objHash2.hashValue)
