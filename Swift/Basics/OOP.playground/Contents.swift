import UIKit
import Foundation

// create class
class Bike {

  var name = ""
  var gears = 0
}

// create object of class
var bike = Bike()


// modify the name property
bike.name = "Racing Bike"

// access the gear property
bike.gears

// define a class
class Bicycle {

// define two properties
var name = ""
var gears = 0
}

// create instance of Person
var bike1 = Bicycle()

// access properties and assign new values
bike1.gears = 11
bike1.name = "Mountain Bike"

print("Name: \(bike1.name), Gears: \( bike1.gears) ")

// define a class
class Employee {

// define a property
var employeeID = 0
}

// create two objects of the Employee class
var employee1 = Employee()
var employee2 = Employee()

// access property using employee1
employee1.employeeID = 1001
print("Employee ID: \(employee1.employeeID)")

// access properties using employee2
employee2.employeeID = 1002
print("Employee ID: \(employee2.employeeID)")


// create a class
class Room {

  var length = 0.0
  var breadth = 0.0

  // method to calculate area
  func calculateArea() {
    print("Area of Room =", length * breadth)
  }
}

  // create object of Room class
  var studyRoom = Room()

  // assign values to all the properties
  studyRoom.length = 42.5
  studyRoom.breadth = 30.8

  // access method inside class
  studyRoom.calculateArea()

// Initializer

class MyBike {

  // properties with no default values
  var name: String
  var gear: Int

  // assign value using initializer
  init(name: String, gear: Int){
    self.name = name
    self.gear = gear
  }
}

// object of Person with custom initializer
var mybike1 = MyBike(name: "BMX Bike", gear: 2)

print("Name: \(mybike1.name) and Gear: \(mybike1.gear)")


// Struct

struct Bike2 {
  var color: String

  init(color:String) {
    self.color = color
  }
}

var bike2 = Bike2(color: "Blue")

var bike3 = bike2

bike2.color = "Red"
print(bike2.color)  // prints Red
print(bike3.color)  // prints blue

//Swift Properties

class Person {

 // define two properties
 var name: String = ""
 var age: Int = 0
}

var person1 = Person()

// assign values to properties
person1.name = "Kevin"
person1.age = 42

// access properties
print("Name:", person1.name)
print("Age:", person1.age)

// Stored Property
class Calculator {
  // define stored property
  var num1: Int = 0
}

//Computed Property

class Calculator1 {
   
    var num1: Int
    var num2: Int
    
    init(num1: Int, num2: Int) {
      self.num1 = num1
      self.num2 = num2
    }
  // define computed property
  var sum: Int {
 
      // retrieve value
          get {
            num1 + num2
          }
        
          // set new value to num1 and num2
          set(modify) {
            print("modify value: \(modify)")
            num1 = (modify + 10)
            num2 = (modify + 20)
          }
  }
}

let calc = Calculator1(num1: 10, num2: 20)
print("Sum:", calc.sum)
calc.num1 = 60
calc.num2 = 40

print("old num1 value:", calc.num1)
print("old num2 value:", calc.num2)

print("Sum:", calc.sum)

//Getters And Setters for Computed Properties


// get value
print("Get value:", calc.sum)

// provide value to modify
calc.sum = 55

print("New num1 value:", calc.num1)
print("New num2 value:", calc.num2)


//Swift Static Properties

class University {

 // static property
    static var name: String = ""

 // non-static property
 var founded: Int = 0
}

// create an object of University class
var obj = University()

// assign value to static property
University.name = "Kathmandu University"
print(University.name)

// assign value to non-static property
obj.founded = 1991
print(obj.founded)
/*
 In the above example, we have a static property: name and a non-static property - founded Here,

 University.name - access the static property using class name
 obj.founded - access the non-static property using the object of the class

 */

//Swift Methods

class Person1 {
  
  // define a method
  func greet() {
    print("Hey Nick!")
  }
}

var nick = Person1()

// call method
nick.greet()

//Calculate Area and Volume using Swift Methods

// create a class
class Hall {

  var length    = 0.0
  var breadth   = 0.0
  var height    = 0.0

  // method to calculate area
  func calculateArea() {
    print("Area of Hall =", length * breadth)
  }

  // method to calculate volume
  func calculateVolume() {
    print("Volume of Hall =", length * breadth * height)
  }
}

// create object of Hall class
var hall1 = Hall()

hall1.length    = 42.5
hall1.breadth   = 30.8
hall1.height    = 45.2

// call calculateArea() method
hall1.calculateArea()

// call calculateVolume() method
hall1.calculateVolume()

//Swift static Methods

class Calculator2 {

  // non-static method
  func multiply(num1: Int, num2: Int) -> Int {
    return num1 * num2
  }

  // static method
  static func add(num1: Int, num2: Int) -> Int {
    return num1 + num2
   }
}

// create an instance of the Calculator class
var objCalc = Calculator2()

// call static method
var result2 =  Calculator2.add(num1: 2, num2: 3)
print("2 + 3 =", result2)

// call non-static method
var result1 = objCalc.multiply(num1:2,num2:2)
print("2 * 2 =", result1)

//Swift self property in Methods

class Marks {
    
  var physics = 0
  func checkEligibility(physics: Int) {

    // using self property
    if (self.physics < physics) {
      print("Not Eligible for admission")
    }
    else {
      print("Eligible for admission")
    }
  }
    
}

var student1 = Marks()
student1.physics = 88
student1.checkEligibility(physics: 50)

// Swift Method

class Person3 {
  
  // define a method
  func greet() {
    print("Hey there!")
  }
}

var nick3 = Person3()

// call method
nick3.greet()


// create a class
class Hall1 {

  var length = 0.0
  var breadth = 0.0
  var height = 0.0

  // method to calculate area
  func calculateArea() {
    print("Area of Hall =", length * breadth)
  }

  // method to calculate volume
  func calculateVolume() {
    print("Volume of Hall =", length * breadth * height)
  }
}

// create object of Hall class
var hall2 = Hall1()

hall2.length = 42.5
hall2.breadth = 30.8
hall2.height = 45.2

// call calculateArea() method
hall2.calculateArea()

// call calculateVolume() method
hall2.calculateVolume()

//Swift static Methods

class Calculator4 {

  // non-static method
  func multiply(num1: Int, num2: Int) -> Int {
    return num1 * num2
  }

  // static method
  static func add(num1: Int, num2: Int) -> Int {
    return num1 + num2
   }
}

// create an instance of the Calculator class
var obj4 = Calculator4()

// call static method
var result4 =  Calculator4.add(num1: 2, num2: 3)
print("2 + 3 =", result4)

// call non-static method
var result5 = obj4.multiply(num1:2,num2:2)
print("2 * 2 =", result5)


//Swift self property in Methods

var student4 = Marks()
student4.physics = 28
student4.checkEligibility(physics: 50)
/*
 Here,

 self.physics - refers to the property of the student1 object with value 28.
 physics - refers to the method parameter with value 50.

 */

//Swift mutating Methods

struct Employee4 {
  var salary = 0
  
  // define mutating function
  mutating func salaryIncrement(increase: Int) {

  // modify salary property
  salary = salary + increase
  print("Increased Salary:",salary)
  }
}

var employee4 = Employee4()
employee4.salary = 20000
employee4.salaryIncrement(increase: 5000)

/*

 Here, since struct is a value type, if we try to modify the value of salary, we'll get an error message.

 However, if we want to modify the properties of a value type from the inside of a method, we need to use the mutating keyword while declaring a method.
 
 */

//Swift Initializer


// declare a class
class  Wall {
  var length: Double

  // initializer to initialize property
  init() {
    length = 5.5
    print("Creating a wall.")
    print("Length = ", length)
  }
}

// create an object
var wall1 = Wall()

//Parameterized Initializer

// declare a class
class Wall6 {
  var length: Double
  var height: Double

  // parameterized initializer to initialize properties
  init(length: Double, height: Double) {
    self.length = length
    self.height = height
  }

  func calculateArea() -> Double {
    return length * height
  }
}

// create object and initialize data members
var wall61 = Wall6(length: 10.5, height: 8.6)
var wall2 = Wall6(length: 8.5, height: 6.3)

print("Area of Wall 1: ", wall61.calculateArea())
print("Area of Wall 2: ", wall2.calculateArea())

//Initializer Overloading


class Person7 {
  var age: Int

  // 1. initializer with no arguments
  init() {
    age = 20
  }

  // 2. initializer with an argument
  init(age: Int) {
    self.age = age
  }

  // method to return age
  func getAge() -> Int {
    return age
  }
}

var person71 = Person7()
var person72 = Person7(age: 23)

print("Person1 Age:", person71.getAge())
print("Person1 Age:", person72.getAge())

//Swift convenience Initializer

class University4 {
  
  var name : String
  var rank : String
  
  // primary or designated initializer
  init(name : String, rank: String) {
    self.name = name
    self.rank = rank
  }

  // define convenience init
  convenience init() {
    self.init(name: "Kathmandu University", rank: "1st")
  }
  
}

var university41 = University4()
print(university41.name)
print("Rank:", university41.rank)
/*
 In the above example, we have created a designated initializer: init() and a convenience initializer: convenience init().

 Inside the convenience initializer, we have called the designated initializer and assigned values to the properties.
 */

//Convenience Initializers are useful when it comes to assigning default values to stored properties.


//Failable Initializer


class File {

  var folder: String

  // failable initializer
  init?(folder: String) {

    // check if empty
    if folder.isEmpty {
      print("Folder Not Found") // 1st output
      return nil
    }
    self.folder = folder
  }
}

// create folder1 object
var file  = File(folder: "")
if (file != nil) {
  print("File Found Successfully")
}
else {
  print("Error Finding File") // 2nd output
}
//In some cases initializers might or might not work, this is called a failable initializer.



//Memberwise Initializer for structs

struct Person8 {

  // define two properties
  var name: String
  var age: Int
}

// object of Person with memberwise initializer
var person8 = Person8(name: "Dwight", age: 43)

print("Name:", person8.name)
print("Age:", person8.age)


//Swift Deinitialization


// declare a class
class  Race {
  var laps: Int

  // define initializer
  init() {
    laps = 5
    print("Race Completed")
    print("Total laps:", laps)
  }

  // define deinitializer
  deinit {
    print("Memory Deallocated")
  }
}

// create an instance
var result: Race? = Race()

// deallocate object
result = nil

/*
 
 In Swift, we only use deinitializers when we manually want to deallocate instances. Otherwise, Swift automatically does the deallocation.
 Deinitializers can only be used with classes and not with structs.
 Each class can only have a single deinitializer.
 
 */


//Swift Inheritance


//Swift Inheritance Syntax

class Animal {
    
    // properties and method of the parent class
    var name: String = ""

    func eat() {
      print("I can eat")
    }
}

  // inherit from Animal
  class Dog: Animal {

    // new method in subclass
    func display() {

      // access name property of superclass
      print("My name is ", name);
    }
  }

  // create an object of the subclass
  var labrador = Dog()

  // access superclass property and method
  labrador.name = "Rohu"
  labrador.eat()

  // call subclass method
  labrador.display()


//is-a relationship
/*
 
 In Swift, inheritance is an is-a relationship. That is, we use inheritance only if there exists an is-a relationship between two classes. For example,

 Car is a Vehicle
 Apple is a Fruit
 Cat is an Animal
 Here, Car can inherit from Vehicle, Apple can inherit from Fruit, and so on.


 
*/


//Example: Method Overriding


class Animal1 {

 // method in the superclass
 func eat() {
   print("I can eat")
 }
}

// Dog inherits Animal
class Dog1: Animal1 {

  // overriding the eat() method
  override func eat() {
    print("I eat dog food")
  }
}

// create an object of the subclass
var labrador1 =  Dog1()

// call the eat() method
labrador1.eat()

//super Keyword in Swift Inheritance


class Animal2 {

  // create method in superclass
  func eat() {
    print("I can eat2")
  }
}

// Dog inherits Animal
class Dog2: Animal2 {

  // overriding the eat() method
  override func eat() {

  // call method of superclass
  super.eat()
  print("I eat dog food2")
  }
}

// create an object of the subclass
var labrador2 =  Dog2()

// call the eat() method
labrador2.eat()
/*
 In the above example, the eat() method of the Dog subclass overrides the same method of the Animal superclass.

 */


//Why Inheritance? : Code Reusability and readability


class RegularPolygon {

 func calculatePerimeter(length: Int, sides: Int) {
   var result = length * sides
   print("Perimeter:", result )
 }
}

// inherit Square from Polygon
class RegularSquare: RegularPolygon {
 var length = 0
 var sides = 0

 func calculateArea() {
   var area = length * length
   print("Regular Square Area:", area)
 }
}

// inherit Pentagon from Polygon
class RegularTriangle: RegularPolygon {
 var length = 0.0
 var sides = 0.0

 func calculateArea() {
   var area = (sqrt(3)/4) * (length * length)
   print("Regular Triangle Area:", area)
 }
}
var shape = RegularSquare()
shape.length = 4
shape.calculateArea()
shape.calculatePerimeter(length: 3,sides:4)

var shape2 = RegularTriangle()
shape2.length = 2
shape2.calculateArea()
shape2.calculatePerimeter(length: 2,sides:3)

//Swift Overriding
//Swift Method Overriding


class Vehicle {

  // method in the superclass
  func displayInfo() {
    print("Four Wheeler or Two Wheeler")
  }
}

// Car inherits Vehicle
class Car: Vehicle {

  // overriding the displayInfo() method
  override func displayInfo() {
      
    print("Four Wheeler")
  }
}

// create an object of the subclass
var car1 =  Car()

// call the displayInfo() method
car1.displayInfo()

//Access Overridden Method in Swift

// Use // access displayInfo() of superclass
//super.displayInfo() inside Car subclass method displayInfo


//Prevent Method Overriding
/*

class Vehicle1 {
    
 
     }
     
     // Car inherits Vehicle
     class Car1: Vehicle1 {
     
     // attempt to override
     override func displayInfo() {
     print("Four Wheeler")
     }
     }
     
     // create an object of the subclass
     var car11 =  Car1()
     
     // call the displayInfo() method
     car11.displayInfo()
     
     Note:
     
     Once the method is declared as final, we cannot override it. So when we try to override the final method,
     
     //we get an error message: error: instance method overrides a 'final' instance method.
     
     
     */
    
    
    
//Override Swift Properties


class University8 {

   var storedCost = 0
  // computed property
  var cost: Int {
  return 5000
 }
}

class Fee8: University8 {
   
 //Cannot override with a stored property in Swift
 //override var storedCost: Int = 10
    
 // override computed property
 override var cost: Int {
 return 10000
 }
}

var amount = Fee8()

// access fee property
print("New Fee:", amount.cost)


//Swift Protocols
//In Swift, a protocol defines a blueprint of methods or properties that can then be adopted by classes (or any other types).
//The protocol just holds the method or properties definition, not their actual body.
//The protocol must specify whether the property will be gettable or gettable and settable.

protocol Greet {

  // blueprint of a property
  var name: String { get }

  // blueprint of a method
  func message()
}

//Conform Class To Swift Protocol

// conform class to Greet protocol
class EmployeeA: Greet {

  // implementation of property
  var name = "Perry"

  // implementation of method
  func message() {
    print("Good Morning!")
  }
}

protocol GreetB {
  
  // blueprint of property
  var name: String { get }

  // blueprint of a method
  func message()
}

// conform class to Greet protocol
class EmployeeB: GreetB {

  // implementation of property
  var name = "Perry"

  // implementation of method
  func message() {
    print("Good Morning", name)
  }
}

var employeeB = EmployeeB()
employeeB.message()

//Swift Protocol to Calculate Area

protocol Polygon {

  func getArea(length: Int, breadth: Int)
}

// conform the Polygon protocol
class Rectangle: Polygon {

  // implementation of method
  func getArea(length: Int, breadth: Int) {
    print("Area of the rectangle:", length * breadth)
  }
}

// create an object
var r1 = Rectangle()

r1.getArea(length:5, breadth: 6)

//Conforming Multiple Protocols

// create Sum protocol
protocol Sum {

  func addition()
}

// create Multiplication protocol
protocol Multiplication {

  func product()
}

// conform class to two protocols
class Calculate: Sum, Multiplication {

  var num1 = 0
  var num2 = 0

  func addition () {
    let result1 = num1 + num2
    print("Sum is:", result1)
  }

  func product () {
    let result2 = num1 * num2
    print("Product is:", result2)
  }
                   
}

// create an object
var calc1 = Calculate()

// assign values to properties
calc1.num1 = 5
calc1.num2 = 10

// access methods
calc1.addition()
calc1.product()

//Swift Protocol Inheritance

protocol CarC {
  var colorOptions: Int { get }
}

// inherit Car protocol
protocol BrandC: CarC {
  var name: String { get }
}

class Mercedes: BrandC {

  // must implement properties of both protocols
  var name: String = ""
  var colorOptions: Int = 0
}

var carC = Mercedes()
carC.name = "Mercedes AMG"
carC.colorOptions = 4

print("Name:", carC.name)
print("Color Options:", carC.colorOptions)

//Protocol Extensions

// protocol definition
protocol Brake {
  func applyBrake()
}

// define class that conforms Brake
class CarD: Brake {
  var speed: Int = 0

  func applyBrake() {
    print("Brake Applied")
  }
}

// extend protocol
extension Brake {
  func stop() {
    print("Engine Stopped")
  }
}

let carD = CarD()
carD.speed = 61
print("Speed:", carD.speed)

carD.applyBrake()

// access extended protocol
carD.stop()
