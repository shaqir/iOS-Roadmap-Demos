import UIKit

var greeting = "Hello, Equatable"
print(greeting)

//In Swift, an Equatable is a protocol that allows two objects to be compared using the == operator. The hashValue is used to compare two instances.

//To use the hashValue, we first have to conform (associate) the type (struct, class, etc) to Hashable property. For example,

//Here, we have conformed the Employee struct to the Hashable protocol.

//Now when we create instances of Employee, the protocol will provide hash values to the instances.


struct EmployeeA: Hashable {
  var name: String
}

let objA1 = EmployeeA(name: "Sabby")
let objA2 = EmployeeA(name: "Smith")

// compare obj1 and obj2
if objA1 == objA2 {
    print("obj1 and obj2 are equal")
}
else {
    print("obj1 and obj2 are not equal")
}
//Compare Instances using Hashable Protocol

// conform Employee to Equatable
struct Employee: Equatable {
    
    var name: String
    var salary: Int
}

// initialize two objects with different property values
let obj1 = Employee(name: "Sabby", salary: 40000)
let obj2 = Employee(name: "Sabby", salary: 40000)
let obj3 = Employee(name: "Cathy", salary: 30000)

// compare obj1 and obj2
if obj1 == obj2 {
    print("obj1 and obj2 are equal")
}
else {
    print("obj1 and obj2 are not equal")
}

// compare obj1 and obj3
if obj1 == obj3 {
    print("obj1 and obj3 are equal")
}
else {
    print("obj1 and obj3 are not equal")
}

//Equatable Function
/*
 In the above example, we have compared all the properties of the struct.

 However, sometimes we may want to compare selective properties of the type. In this case, we may use the equatable function inside the type. For example,

 */

//Use of Equatable Function


struct EmployeeB: Equatable {
    
  var name: String
  var salary: Int

  // create a equatable function to only compare salary property
  static func == (lhs: EmployeeB, rhs: EmployeeB) -> Bool {
    return lhs.salary == rhs.salary
  }
}

// initialize two objects with different values for name property
let objB1 = EmployeeB(name: "Sabby", salary: 34000)
let objB2 = EmployeeB(name: "Cathy", salary: 34000)

// compare obj1 and obj2
if objB1 == objB2 {
  print("objB1 and objB2 are equal")
}
else {
  print("objB1 and objB2 are not equal")
}
