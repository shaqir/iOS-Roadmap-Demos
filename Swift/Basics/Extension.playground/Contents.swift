 import UIKit
 
//In Swift, we can add new functionality to existing types. We can achieve this using an extension.



// class definition
class Temperature {
  var celsius: Double = 0

  func setTemperature(celsius: Double) {
    self.celsius = celsius
    print("Celsius:", celsius)
  }
}

// declare an extension
extension Temperature {

  // add a new method to Temperature class
  func convert() {
    var fahrenheit = (celsius * 1.8) + 32
    print("Fahrenheit:", fahrenheit)
  }
}

// class initialization
let temp1 = Temperature()
temp1.setTemperature(celsius: 16)

// access extension method using class object
temp1.convert()

class Circle {
    var diameter: Int = 1
}

//In Swift, we cannot add stored properties in extensions. For example,
extension Circle {
  // stored property
  //var radius: Int // error code
    //Extensions must not contain stored properties
}

//Computed Property In Extension

extension Circle {

  // computed property
  var area: Double {
      return 0.0
  }
}

class CircleK {
  var radius: Double = 0
}

extension CircleK {
  // define computed property
  var area: Double {
    return 3.14 * radius * radius
  }
}

let circle1 = CircleK()
circle1.radius = 5
print("Area:", circle1.area)

//Protocol Extension

// protocol definition
protocol Brake {
  func applyBrake()
}

// extend protocol
extension Brake {
  func applyBrake() {
    print("Brake Applied")
  }
}

// define class that conforms Brake
class Car: Brake {
  var speed: Int = 0
}

let car1 = Car()
car1.speed = 61
print("Speed:", car1.speed)

// access extended protocol
car1.applyBrake()
