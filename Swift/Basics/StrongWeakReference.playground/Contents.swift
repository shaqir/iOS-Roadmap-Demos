import UIKit

var greeting = "Hello, Strong and Weak Reference"

//Swift Strong and Weak References

/*
In Swift, ARC (Automatic Reference Counting) automatically handles the allocation and deallocation of memory.

However, we can prevent ARC to automatically dellocate memory by specifying the type of reference. For example, a strong reference keeps a firm hold on instances and doesn't allow deallocation by ARC.

Similarly, a weak reference cannot protect the instances from being deallocated by ARC.
 
 */

//Strong Reference in Swift


//In Swift, whenever we create an instance of a class, a reference count value is increased from 0 to 1. Similarly, if we dellocate the instance the count is decreased to 0. Let's see an example,

class Employee {
  var name: String
  var colleague: Employee?

  // define initializer
  init(name : String) {
    self.name = name;
  }
}

// create two objects of Employee
//var sabby: Employee? = Employee(name: "Sabby")
//var cathy: Employee? = Employee(name: "Cathy")
//

//Now the reference count of both instances sabby and cathy is 1.

//Here, we have created a strong reference inside the class.

//var colleague: Employee?

//Now, let's use this reference to refer to the colleague property of sabby to cathy.


//sabby?.colleague = cathy

//In this case, a new reference made for cathy which increases the reference count of cathy to 2 from 1.


//Similarly, if we assign sabby to the colleague of cathy, the reference count of sabby will be increased to 2.

//cathy?.colleague = sabby

//Here, both instances sabby and cathy will have the reference count 2.

//Deallocate Instances

//In Swift, the memory instance is only deallocated if its reference count is 0. And to manually deallocate memory instances, we assign nil to the reference. For example,

//sabby = nil
//cathy = nil

/*
 When we assign nil to the instance, the reference count of instances will be decreased by 1. Here, the above code will decrease the reference count of sabby and cathy by 1.

 However, due to strong references, the reference count of both sabby and cathy is 2, so the final reference count after deallocation will be 1 (2 - 1).

 That's strong references sabby and cathy won't be deallocated (reference count not equal to 0).


 Note: The class type must be of optional type, so that we can assign nil to objects of that class. That's why we have used Employee? instead of Employee.
 */

//Example: Swift Strong Reference


// declare a class
class  Employe {
    
  var name: String
  var salary: Int
  var colleague: Employe?

  // define initializer
  init(name: String, salary: Int) {
    self.name = name
    self.salary = salary
  }

  // define deinitializer
  deinit {
    print("Memory Deallocated")
  }
}

// create instances of Employee
var sabby: Employe? = Employe(name: "Sabby", salary: 50000)
var cathy: Employe? = Employe(name: "Cathy", salary: 45000)

// increased reference count of cathy and sabby to 2
sabby?.colleague = cathy
cathy?.colleague = sabby

// deallocate objects
sabby = nil
cathy = nil
/*
 In the above example, we have assigned nil to instances sabby and cathy. However, sabby and cathy are of strong references and deallocating them only decreases their reference count from 2 to 1.

 */

//That's why the deinitializer is not called and we didn't get any output.

//If we want to completely deallocate the instances, we use weak references instead.


//Swift Weak Reference

/*
 As mentioned earlier, a weak reference doesn't protect the object from being deallocated. This is because when we declare a property as weak, the reference count of that property will never be more than 1.

 Note: By default the property are of strong type.


 */

//Example 2: Weak Reference


// declare a class
class  WeakEmployee {
    
  var name: String
  var salary: Int

  // weak property declaration
  weak var colleague: WeakEmployee?

  // define initializer
  init(name: String, salary: Int) {
    self.name = name
    self.salary = salary
  }

  // define deinitializer
  deinit {
    print("Memory Deallocated for weaks")
  }
}

// create instances of Employee
var weaksabby: WeakEmployee? = WeakEmployee(name: "Sabby", salary: 50000)
var weakcathy: WeakEmployee? = WeakEmployee(name: "Cathy", salary: 45000)

// colleague property of sabby instance refers to cathy instance
weaksabby?.colleague = weakcathy

// colleague property of cathy instance refers to sabby instance
weakcathy?.colleague = weaksabby

// deallocate objects
weaksabby = nil
weakcathy = nil
