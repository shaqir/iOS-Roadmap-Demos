import UIKit

var greeting = "Hello, Type Alias"

//A type alias allows you to provide a new name for an existing data type into your program.
//After a type alias is declared, the aliased name can be used instead of the existing type throughout the program.

//Type alias do not create new types. They simply provide a new name to an existing type.

//The main purpose of typealias is to make our code more readable, and clearer in context for human understandin

//How to create a typealias?

//typealias name = existing type

/*
 
 In Swift, you can use typealias for most types. They can be either:

 Built-in types (for.eg: String, Int)
 User-defined types (for.e.g: class, struct, enum)
 Complex types (for e.g: closures)

 
 */

//Typealias for built-in types

typealias StudentName = String

let name:StudentName = "Jack"
print(name)

//Typealias for user defined types


class Student {

}

typealias Students = Array<Student>

//Now we can make our code more readable as:
// Instead of this: var students:Array<Student> = []

var students:Students = []

//Typealias for complex types

//Suppose we have a method that takes a closure as an input parameter.

func someMethod(oncomp:(Int)->(String)){
}

//You can see the use of (Int)->(String) makes less sense to the reader. You can use typealias to provide a new name for it:

typealias CompletionHandler = (Int)->(String)

func someMethodA(oncomp:CompletionHandler){
    
}
