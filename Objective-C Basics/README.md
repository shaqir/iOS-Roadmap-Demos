# Objective-C Basics 


✅ 1. Program Structure

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"Hello, Objective-C!");
    }
    return 0;
}
 

✅ 2. Variables and Data Types
 

int age = 30;
float height = 5.9;
char grade = 'A';
BOOL isMarried = NO;
NSString *name = @"Sakir";

✅ 3. Constants

.#define PI 3.14159
const int maxUsers = 100;

NSLog(@"Pi value: %f, Max users: %d", PI, maxUsers);
 

✅ 4. Operators

int a = 10, b = 5;
int sum = a + b;
int diff = a - b;
int mult = a * b;
int div = a / b;

NSLog(@"Sum: %d, Diff: %d", sum, diff);


✅ 5. Conditional Statements

int age = 20;

if (age >= 18) {
    NSLog(@"Adult");
} else {
    NSLog(@"Minor");
}

Switch

int day = 3;

switch(day) {
    case 1: NSLog(@"Monday"); break;
    case 2: NSLog(@"Tuesday"); break;
    case 3: NSLog(@"Wednesday"); break;
    default: NSLog(@"Unknown");
}


✅ 6. Loops

For Loop

for (int i = 1; i <= 5; i++) {
    NSLog(@"%d", i);
}

While Loop

int i = 0;
while (i < 3) {
    NSLog(@"While loop %d", i);
    i++;
}

Do-While Loop

int j = 0;
do {
    NSLog(@"Do-While %d", j);
    j++;
} while (j < 2);


✅ 7. Arrays


NSArray *fruits = @[@"Apple", @"Banana", @"Cherry"];
NSLog(@"First fruit: %@", fruits[0]);


✅ 8. NSMutableArray

NSMutableArray *colors = [NSMutableArray arrayWithObjects:@"Red", @"Blue", nil];
[colors addObject:@"Green"];
[colors removeObject:@"Blue"];
NSLog(@"Colors: %@", colors);


✅ 9. Dictionaries

NSDictionary *person = @{@"name": @"Sakir", @"city": @"Edmonton"};
NSLog(@"Name: %@", person[@"name"]);

✅ 10. NSMutableDictionary
 
NSMutableDictionary *dict = [NSMutableDictionary dictionary];
[dict setObject:@"Canada" forKey:@"country"];
NSLog(@"%@", dict);


✅ 11. Methods (Functions)

Without Parameter 

- (void)sayHello {
    NSLog(@"Hello!");
}

With Parameter

- (void)greet:(NSString *)name {
    NSLog(@"Hello, %@", name);
}

With Return Type

- (int)add:(int)a with:(int)b {
    return a + b;
}

✅ 12. Classes and Objects

MyClass.h
.#import <Foundation/Foundation.h>

@interface MyClass : NSObject

@property NSString *title;
- (void)display;

@end

MyClass.m

.#import "MyClass.h"

@implementation MyClass

- (void)display {
    NSLog(@"Title: %@", self.title);
}

@end

main.m

.#import "MyClass.h"

@implementation MyClass

- (void)display {
    NSLog(@"Title: %@", self.title);
}

@end

✅ 13. Inheritance

ParentClass.h

@interface ParentClass : NSObject
- (void)sayHi;
@end


ParentClass.m

@implementation ParentClass
- (void)sayHi {
    NSLog(@"Hi from Parent");
}
@end

ChildClass.h

.#import "ParentClass.h"
@interface ChildClass : ParentClass
@end

ChildClass.m

@implementation ChildClass
@end

✅ 14. Categories

// NSString+Utils.h
@interface NSString (Utils)
- (BOOL)isLong;
@end

// NSString+Utils.m
@implementation NSString (Utils)
- (BOOL)isLong {
    return self.length > 10;
}
@end

✅ 15. Protocols (Interfaces)
 
 @protocol Printer
- (void)print;
@end

@interface Report : NSObject <Printer>
@end

@implementation Report
- (void)print {
    NSLog(@"Printing report...");
}
@end

✅ 16. Blocks (Closures)

void (^printMessage)(void) = ^{
    NSLog(@"Hello from block!");
};

int (^add)(int, int) = ^(int a, int b) {
    return a + b;
};

printMessage();
NSLog(@"Sum: %d", add(3, 4));


✅ 17. Memory Management

Handled by ARC, but you still see:

@autoreleasepool {
    // memory management zone
}

✅ 18. Dot Notation vs Bracket Notation
 
person.name = @"Sakir";           // dot notation
[person setName:@"Sakir"];        // bracket notation


✅ 19. NSLog vs printf
 
NSLog(@"Objective-C logging");   // includes timestamp, etc.
printf("C-style logging\n");     // plain output

