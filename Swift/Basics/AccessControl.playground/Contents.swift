import UIKit

var greeting = "Hello, Access Control"
print(greeting)

/*
 
 In Swift, access controls are used to set the accessibility (visibility) of classes, structs, enums, properties, methods, initializers, and subscripts. For example,

 class Vehicle {

   public func method1() {...}
   private func method2() {...}
 }
 
 method1() is public i.e. it can be accessed by other classes.
 method2() is private i.e. it can not be accessed by other classes.
 
 */


//Types of Swift Access Controls

/*

 Controls    Description
 
 public     declarations are accessible from everywhere
 
 private    declarations are accessible only within the defined class or struct
 
 fileprivate declarations are accessible only within the current swift file
 
 internal    declarations are accessible only within the defined module (default)

 
*/

//public Access Control

class Animal {

  // public property
  public var legCount: Int = 0

  // public method
  public func display() {
    print("I am an animal.");
    print("Total Legs:", legCount)
  }
}

// create an object
var obj = Animal()

// access and assign value to public property
obj.legCount = 4

// access the public method
obj.display()


//private Access Control

class Student {

  // private property
  private var name = "Tim Cook"

  // private method
  private func display() {
    print("Hello from Student class")
  }
}

// create object of Student class
var student1 = Student()
    
// access name property
//print("Name:", student1.name) // Error
//'name' is inaccessible due to 'private' protection level

// access display() method
//student1.display()//Error:
//'display' is inaccessible due to 'private' protection level


//fileprivate Access Control
class StudentA {

  // fileprivate property
  fileprivate var name = "Tim Cook"

  // fileprivate method
  fileprivate func display() {
    print("Hello from Student class")
  }
}

// create object of Student class
var student11 = StudentA()
    
// access name property
print("Name:", student11.name)

// access display method
student11.display()

/*
 Since the name and display() are marked as fileprivate, these data members are accessible from anywhere in the source file where it is defined.
 Note: If we create another Swift file and try to access the fileprivate data members, we'll get an error.
 */

//internal Access Control

/*
 When we declare a type or type member as internal, it can be accessed only within the same module.

 A module is a collection of types (classes, protocols, etc) and resources (data). They are built to work together and form a logical unit of functionality.

 */

//Example: internal Within The Same Module



class StudentB {

  // define internal property
  internal var name = "Tim Cook"
}

// create object of Student class
var student1B = StudentB()
  
// access name property
print("Name:", student1B.name)

//If we use internal within a single module, it works just like the public access modifier.
//If we create another module and try to access the internal data members, we'll get an error.



