import UIKit
 
 
// define enum
enum Season {
  
  // define enum values
  case spring, summer, autumn, winter
}

// create enum variable
var currentSeason: Season

// assign value to enum variable
currentSeason = Season.spring

print("Current Season:", currentSeason)

enum PizzaSize {
  case small, medium, large
}

var size = PizzaSize.medium

switch(size) {
  case .small:
    print("I ordered a small size pizza.")

  case .medium:
    print("I ordered a medium size pizza.")

   case .large:
     print("I ordered a large size pizza.");
}

//Iterate Over enum Cases


// conform Languages to caseIterable
enum Seasons: CaseIterable {
  case spring, summer, autumn, winter
}

// for loop to iterate over all cases
for currentSeason in Seasons.allCases {
  print(currentSeason)
}

//Swift enums with rawValue

enum Size : Int {
  case small = 10
  case medium = 12
  case large = 14
}

// access raw value of python case
var result = Size.small.rawValue
print(result)

//Swift enum Associated Values

enum Laptop {

  // associate string value
  case name(String)

  // associate integer value
  case price (Int)
}

// pass string value to name
var brand = Laptop.name("Razer")
print(brand)

// pass integer value to price
var offer = Laptop.price(1599)
print(offer)

//Swift enum With Associated Values

enum Distance {
  
  // associate value
  case km(String)
  case miles(String)
}

// pass string value to km
var dist1 = Distance.km("Metric System")
print(dist1)

// pass string value to miles
var dist2 = Distance.miles("Imperial System")
print(dist2)

enum Marks {

 // associate multiple Double values
case gpa(Double, Double, Double)

// associate multiple String values
case grade(String, String, String)
}

// pass three Double values to gpa
var marks1 = Marks.gpa(3.6, 2.9, 3.8)
print(marks1)

// pass three string values to grade
var marks2 = Marks.grade("A", "B", "C")
print(marks2)

//Named Associated Values

enum Pizza {

  // named associated value
  case small (inches: Int)
  case medium (inches: Int)
  case large (inches: Int)
}

// pass value using provided names
var pizza1 = Pizza.medium(inches: 12)
print(pizza1)

//enum Associated Values and Switch Statement

enum Mercedes {

 case sedan(height: Double)
 case suv(height: Double)
 case roadster(height: Double)
}

var choice = Mercedes.suv(height: 5.4)

switch(choice) {
 case let .sedan(height):
   print("Height:", height)

 case let .suv(height):
   print("Height:", height)

 case let .roadster(height):
   print("Height:", height)
}

//Raw Values VS Associated Values
enum Vehicle: String {

  case car = "Four Wheeler"
  case bike = "Two Wheeler"
}
 
let myVehicle = Vehicle.car.rawValue
print(myVehicle)

//And we assign the associated value to the enum value while creating a variable.

enum Marks1 {
  case grade(String)
  case gpa(Double)
}

var marks = Marks1.grade("A")

/*
 
 Notes:

 An enum cannot have both raw values and associated values at the same time.
 The raw values of an enum must be of the same data type. But associated values can be of any type.
 
 */


//Swift Structs

/*
 In Swift, a struct is used to store variables of different data types. For example,

 Suppose we want to store the name and age of a person. We can create two variables: name and age and store value.

 However, suppose we want to store the same information of multiple people.

 In this case, creating variables for an individual person might be a tedious task. To overcome this we can create a struct that stores name and age. Now, this struct can be used for every person.

 */

//Define Swift Structure

struct Person {
  var name = ""
  var age = 20
}

// create instance of struct
var person1 = Person()

// modify the name property
person1.name = "Swift"

// access the age property
print(person1.name,person1.age)

//Example: Swift Access Struct Properties

// access properties and assign new values
person1.age = 21
person1.name = "Rick"

print("Name: \(person1.name) and Age: \( person1.age) ")

//Example: Create Multiple Instances of Struct

// define a structure
struct Student {

// define a property
var studentID = 0
}

// instance of Person
var student1 = Student()

// access properties and assign new values
student1.studentID = 101

print("Student ID: \(student1.studentID)")

// another instance of Person
var student2 = Student()

// access properties and assign new values
student2.studentID = 102

print("Student ID: \(student2.studentID)")


//Swift Memberwise Initializer

struct PersonA {
  
  var name: String
}

var personA1 = PersonA(name: "Kyle")
print(personA1.name)

//Example: Memberwise Initializer

struct PersonB {

// properties with no default values
var name: String
var age: Int
}

// instance of Person with memberwise initializer
var personB1 = PersonB(name: "Kyle", age: 19)

print("Name: \(personB1.name) and Age: \( personB1.age)")

//Function Inside Swift Struct

struct Car {

  var gear = 0

  // method inside struct
  func applyBrake(){
  print("Applying Hydraulic Brakes")
  }
}

// create an instance
var car1 = Car()

car1.gear = 5

print("Gear Number: \(car1.gear)")
// access method
car1.applyBrake()



///Swift Singleton


//In Swift, Singleton is a design pattern that ensures a class can have only one object. Such a class is called singleton class.

// Example

class FileManager{

 // create a singleton
@MainActor static let fileObj = FileManager()

 // create a private initializer
private init() {}

 // method to request file
func checkFileAccess(user: String) {

  // condition to check username
  if user == ("@programiz.com") {
    print("Access Granted")
  }
  else {
    print(" Access Denied")
  }
}
}

let userName = "@programiz.com"

// access method
let file = FileManager.fileObj

file.checkFileAccess(user: userName)
