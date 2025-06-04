import UIKit


let someValue = Int()
print(someValue)

//However there is another data type in Swift called Optional, whose default value is a null value (nil).


var someValue1:Int?
var someAnotherValue:Int!
print(someValue1 ?? 0)
print(someAnotherValue)


let someValue2:Int? = 5
print(someValue2)
print(someValue2!)

/*
 In the above program, we have declared an optional of Int type and assigned value 5 in it.

 As you can see, printing the optional as print(someValue) doesn't give you 5 but Optional(5). It is of the form as described above: Optional<Value>. In order to access the <Value> from it, we need a mechanism called unwrapping.

 You can unwrap an optional by appending ! character at the end of the variable/constant as in the next line print(someValue!). print(someValue!) unwraps the optional and outputs 5 on the screen.

 However, remember, this kind of unwrapping mechanism should only be used when you are certain that the optional will sure have a value when you access it.

 */

let someValue3:Int? = 15
print(someValue3!)

var someValue4:Int!
//var unwrappedValue:Int = someValue4 //crashes due to this line

/*
 When you run the program, you will get a crash as fatal error: unexpectedly found nil while unwrapping an Optional value because the code unwrappedValue:Int = someValue tries to assign value from Optional someValue to variable unwrappedValue.

 */

//Optional Handling


// conditionally unwrapping asks Check if this variable has a value? . If yes, give the value, otherwise it will handle the nil case.

//Example : Optional handling with if else statement


var someValue5:Int?
var someAnotherValue2:Int! = 0
        
if someValue5 != nil {
    print("It has some value \(someValue5!)")
} else {
    print("doesn't contain value")
}
        
if someAnotherValue2 != nil {
    print("It has some value \(someAnotherValue2!)")
} else {
    print("doesn't contain value")
}

//  Optional Binding (if-let)


var someValue6:Int?
var someAnotherValue3:Int! = 0
       
if let temp = someValue6 {
    print("It has some value \(temp)")
} else {
    print("doesn't contain value")
}
        
if let temp = someAnotherValue3 {
    print("It has some value \(temp)")
} else {
    print("doesn't contain value")
}

// Guard Statement

func testFunction() {
    let someValue:Int? = 5
    guard let temp = someValue else {
        return
    }
    print("It has some value \(temp)")
}

testFunction()

// Nil-coalescing operator

var someValue7:Int!
let defaultValue1 = 55
let unwrappedValue1:Int = someValue7 ?? defaultValue1
print(unwrappedValue1)

var someValue8:Int? = 100
let defaultValue2 = 5
let unwrappedValue2:Int = someValue8 ?? defaultValue2
print(unwrappedValue2)

