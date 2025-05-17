import UIKit
 
//1. Swift if Statement & else statements

let number = 11

// check if number is greater than 0
if (number > 0) {
  print("Number is positive.")
}
else{
    print("The if statement is easy")
}


//3. Swift if...else if...else Statement

// check whether a number is positive, negative, or 0.

let number1 = 0

if (number1 > 0) {
    print("Number is positive.")
}
else if (number1 < 0) {
    print("Number is negative")
}
else {
    print("Number is 0.")
}

print("This statement is always executed")

//Example 4: Nested if...else Statement

var number4 = 5

// outer if statement
if (number4 >= 0) {

  // inner if statement
  if (number4 == 0) {
      print("Number is 0")
  }

  // inner else statement
  else {
      print("Number is positive");
  }
}

// outer else statement
else {
    print("Number is negative");
}


//Swift switch Statement

// program to find the day of the week

let dayOfWeek = 4

switch dayOfWeek {
  case 1:
    print("Sunday")
        
  case 2:
    print("Monday")
        
  case 3:
    print("Tuesday")
        
  case 4:
    print("Wednesday")
        
  case 5:
    print("Thursday")
        
  case 6:
    print("Friday")
        
  case 7:
    print("Saturday")
        
  default:
    print("Invalid day")
}

//Switch Statement with fallthrough

// program to find the day of the week

let day_Of_Week = 4

switch day_Of_Week {
  case 1:
    print("Sunday")
        
  case 2:
    print("Monday")
        
  case 3:
    print("Tuesday")
        
  case 4:
    print("Wednesday")
    fallthrough
        
  case 5:
    print("Thursday")
        
  case 6:
    print("Friday")
        
  case 7:
    print("Saturday")
        
  default:
    print("Invalid day")
}

//Example 2: Switch Statement with Range

let ageGroup = 33

switch ageGroup {
  case 0...16:
    print("Child")

  case 17...30:
    print("Young Adults")

  case 31...45:
    print("Middle-aged Adults")

  default:
    print("Old-aged Adults")
}

//Tuple in Switch Statement


let info = ("Dwight", 38)

// match complete tuple values
switch info {
  case ("Dwight", 38):
    print("Dwight is 38 years old")

  case ("Micheal", 46):
    print("Micheal is 46 years old")

  default:
    print("Not known")
}

// For Loop Over Array

// access items of an array
let languages = ["Swift", "Java", "Go", "JavaScript"]

for language in languages {
      print(language)
}

//for Loop with where Clause
// remove Java from an array

for language in languages where language != "Go"{
  print(language)
}

//for Loop With Range
// iterate from i = 1 to i = 3
for i in 1...3 {
    print(i)
}


//for Loop with Stride Function


for i in stride(from: 1, to: 10, by: 2) {
    print(i)
}
//In the above example, the loop iterates over the range from 1 to 10 with an interval of 2. However, 10 is not included in the sequence.


//Example : Swift while Loop

// program to display numbers from 1 to 5

// initialize the variable

print("Swift while Loop")

var i = 1, n = 5

// while loop from i = 1 to 5
while (i <= n) {
  print(i)
   i = i + 1
}

//Example : while Loop to Display Game Level

var currentLevel:Int = 0, finalLevel:Int = 5
let gameCompleted = true
while (currentLevel <= finalLevel) {

  if gameCompleted {
    print("You have passed level \(currentLevel)")
      currentLevel += 1
  }
}
print("Level Ends")

//Example: repeat...while Loop

// program to display numbers

var i1 = 1, n1 = 5

// repeat...while loop from 1 to 5
repeat {
  
  print(i1)

  i1 = i1 + 1

} while (i1 <= n1)

//Infinite while Loop

//while (true) {
//   print("Endless Loop")
//}


//Swift Nested for Loop

// Swift program to display 7 days of 2 weeks

// outer loop
for week in 1...2 {
  print("Week: \(week)")

// inner loop
    for day in 1...7 {
      print("  Day:  \(day)")
  
   }

// line break after iteration of outer loop
   print("")
}

//Swift for Loop inside a while Loop

// program to display 7 days of 4 weeks
var weeks = 4
var i5 = 1

// outer while loop
while (i5 <= weeks){
  print("Week: \(i5)")

  // inner for loop
  for day in 1...7{
      print("  Day:  \(day)")
    }

    i5 = i5 + 1
}


// break inside Nested Loop
print("break inside Nested Loop")

// outer loop
for week in 1...3 {
  print("Week: \(week)")

  // inner loop
  for day in 1...7 {


    if(week == 2) {
      // use of break statement
      break
      }

    print("  Day:  \(day)")
   }

  print("")
}


//2. continue inside a Nested Loop

print("continue inside a Nested Loop")

// outer loop
for week in 1...2 {
  print("Week: \(week)")

  // inner loop
  for day in 1...7 {

    // use of continue statement
    // the continue statement is executed when the value of day is odd
    if(day % 2 != 0) {
      continue
      }

   print("  Day:  \(day)")
   }

  print("")
}

//Swift break statement with for loop
print("Swift break statement with for loop")


for i in 1...5 {
  
  if i == 3 {
    break
  }
 
print(i)
}
//break with while Loop
print("break with while Loop")

// program to find first 10 multiples of 6

var i6 = 1

while (i6<=11) {
  print("6 * \(i6) =",6 * i6)

    if i6 >= 10 {
      break
   }
 
  i6 = i6 + 1
}

//Swift break statement with nested loops

print("Swift break statement with nested loops")

// outer for loop
for i in 1...3 {

  // inner for loop
  for j in 1...3 {

    if i == 2 {
      break
    }

    print("i = \(i), j = \(j)")
  }
}
//Example: Labeled Statement with break
print("Example: Labeled Statement with break")

outerloop: for i in 1...3{

  innerloop: for j in 1...3 {

    if j == 3 {
      break outerloop
    }
      print("i = \(i), j = \(j)")
  }
}


//Swift continue Statement With for Loop

print("Swift continue Statement With for Loop")
//We can use the continue statement with the for loop to skip the current iteration of the loop.
// output : 1 2 4 5

for i in 1...5 {
  
  if i == 3 {
    continue
  }
 
print(i)
}

//continue with while loop

print("continue with while loop")

// program to print odd numbers from 1 to 10

var num = 0

while num <= 10{
  num += 1

  if (num % 2) == 0 {
    continue
}

print("\(num)")
}


//Swift continue statement with nested loops

print("Swift continue statement with nested loops")


for i in 1...3 {
  for j in 1...3 {
    
    if j == 2 {
      continue
    }
    
    print("i = \(i), j = \(j)")
  }
}

//Example: Labeled Statement with continue

print("Example: Labeled Statement with continue")

outerloop: for i in 1...5{
  
  innerloop: for j in 1...3 {
    
    if j == 3 {
      continue outerloop
    }
    
    print("i = \(i), j = \(j)")
  }
}

//Example: Swift Guard Statement

print("Example: Swift Guard Statement")

var i7 = 2

while (i7 <= 10)
{
  // guard condition to check the even number
  guard i7 % 2 == 0 else {
   
     i7 = i7 + 1
    continue
  }

  print(i7)
  i7 = i7 + 1
}

//guard Statement Inside a Function

print("guard Statement Inside a Function")


// create a function
// create a function
func checkOddEven(number: Int ) {

  // use of guard statement
  guard number % 2 == 0 else {
    
    print("Odd Number",number % 2)
    return
  }
    
  print("Even Number",number % 2)
}

// function call
checkOddEven(number: 7)

// function call
checkOddEven(number: 24)

//guard with multiple conditions


func checkJobEligibility(age: Int) {

  guard age >= 18, age <= 40 else {
    print("Not Eligible for Job")
    return
  }

  print("You are eligible for this job")

}

checkJobEligibility(age: 12)
checkJobEligibility(age: 52)
checkJobEligibility(age: 32)
checkJobEligibility(age: 42)

// Guard let statement

func checkAge(age: Int?) {

  guard let myAge = age else {
    print("Age is undefined")
    return
  }

  print("My age is \(myAge)")
}

checkAge(age: 11)
checkAge(age: nil)
checkAge(age: 0)


//guard Vs if Statement
func voteEligibility(age: Int) {

  if age >= 18 {
  print("Eligible to vote")
  }
  else {
  print("Not eligible to vote")
  }

}

voteEligibility(age: 34)
voteEligibility(age: 14)
voteEligibility(age: 18)


// using guard
print("Using Gurad")

func voteEligibilityGuard(age: Int) {

  guard age >= 18 else {
  print("Not Eligible to vote")
  return
  }

  print("Eligible to vote")
}

voteEligibilityGuard(age: 2)
voteEligibilityGuard(age: 18)



