import UIKit

var greeting = "Hello, Enum"

//Swift Enums + Pattern Matching

//✅ Step 1: Basic Enums
enum Direction {
    case north
    case south
    case east
    case west
}
var move = Direction.north
move = .west

//✅ Step 2: Pattern Matching with switch
switch move {
case .north:
    print("Heading up")
case .south:
    print("Going down")
case .east:
    print("Going right")
case .west:
    print("Going left")
}

//✅ Step 3: Enums with Raw Values
enum Color: String {
    case red = "#FF0000"
    case green = "#00FF00"
    case blue = "#0000FF"
}

enum Plant: String {
    case sunflower = "🌻"
    case rose = "🌹"
    case tulip = "🌷"
}

enum Planet: String, CaseIterable {
    case mercury = "Mercury"
    case venus = "Venus"
    case earth = "Earth"
    case mars = "Mars"
    case jupiter = "Jupiter"
    case saturn = "Saturn"
    case uranus = "Uranus"
    case neptune = "Neptune"
}

let caseList = Planet.allCases
    .map({ "\($0)" })
    .joined(separator: ", ")
print(caseList)

//✅ Step 4: Enums with Raw Values
enum Planet1: Int {
    case mercury = 1, venus, earth, mars
}

let earth = Planet1(rawValue: 3)
print(earth!) // earth

//✅ Step 4: Enums with Associated Values

enum LoginStatus {
    case success(username: String)
    case failure(error: String)
    case loading
}
let status = LoginStatus.success(username: "Sakir")

switch status {
case .success(let name):
    print("Welcome, \(name)!")
case .failure(let error):
    print("Login failed: \(error)")
case .loading:
    print("Loading...")
}

//✅ Step 5: Enums with Custom Methods
enum Temperature {
    case celsius(Double)
    case fahrenheit(Double)
    
    func toCelsius() -> Double {
        switch self {
        case .celsius(let c):
            return c
        case .fahrenheit(let f):
            return (f - 32) * 5 / 9
        }
    }
}

let temp = Temperature.fahrenheit(77)
print(temp.toCelsius()) // 25.0

//✅ Bonus: Enum with Computed Property

enum Weather {
    case sunny
    case rainy(Int) // mm of rain
    
    var description: String {
        switch self {
        case .sunny:
            return "It’s sunny 🌞"
        case .rainy(let mm):
            return "Rainy with \(mm)mm of rain ☔️"
        }
    }
}

let today = Weather.rainy(10)
print(today.description)
