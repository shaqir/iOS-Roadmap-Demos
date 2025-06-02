import UIKit

/*
 
 ✅ Count characters in a string
 ✅ Reverse a string
 ✅ Check for palindrome
 ✅ Extract substring by index or range
 ✅ Split string into words
 ✅ Remove vowels or spaces
 ✅ Count frequency of each character
 ✅ Find the first non-repeating character
 ✅ Convert string to Title Case
 ✅ Replace substring with another
 
 */

// Challenge 1: Count Characters in a String
//Write a function that returns the number of characters in a string.

func countCharacters(in string: String) -> Int {
    return string.count
}
let message = "Hello, Sakir!"
print("Character count:", countCharacters(in: message)) // Output: 13

// Challenge 2: Reverse a String
func reverseString(_ text: String) -> String {
    return String(text.reversed())
}
print(reverseString("Swift")) // Output: "tfiwS"

//Challenge 3: Check Palindrome
//Check if a string reads the same backward and forward.

func isPalindrome(_ input: String) -> Bool {
    let cleaned = input.lowercased().filter { $0.isLetter }
    return cleaned == String(cleaned.reversed())
}

print(isPalindrome("Never odd or even"))

// Challenge 4: Extract a Substring by Index or Range
//Given a string, extract a portion of it between certain start and end positions.

func substringUsingRange(_ input: String, start: Int,end: Int) -> String{
    
    guard start <= end, start >= 0, end < input.count else { return ""}
    let startIndex = input.index(input.startIndex, offsetBy: start)
    let endIndex = input.index(input.startIndex, offsetBy: end)
    return String(input[startIndex...endIndex])
    
}
print(substringUsingRange("Hello World", start: 2, end: 5))

func substringManual(_ text: String, from start: Int, to end: Int) -> String {
    var result = ""
    let chars = Array(text)
    
    for i in start...end where i >= 0 && i < chars.count {
        result += String(chars[i])
    }
    return result
}
print(substringManual("Hello World", from: 2, to: 5))

//Challenge 5: Split String into Words

func splitsStringtoWords(_ input: String) -> [String] {
    return input.split(separator: " ").map(String.init)
}
print(splitsStringtoWords("Hello World"))

//Solution 5.2: Manual Word Splitting (No Higher-Order Functions)
 
func manualWordSplitting(_ input: String) -> [String] {
    
    var words: [String] = []
    var currentWord = ""
    
    for char in input {
        if char == " "{
            if !currentWord.isEmpty {
                words.append(currentWord)
                currentWord = ""
            }
        }
        else{
            currentWord.append(char)
        }
    }
    
    if !currentWord.isEmpty{
        words.append(currentWord)
    }
    
    return words
}

print("Manual Word Splitting:")
print(manualWordSplitting("Hello My World"))
//Output: ["Hello", "My", "World"]

// Challenge 6: Remove Vowels or Spaces
//Solution 1: Using filter (Built-in)

func removeVowels(_ text: String) -> String {
    return text.filter { !"aeiouAEIOU".contains($0) }
}
print(removeVowels("Beautiful")) // "Btfl"

//solution: manual logic

func removeVowelsManual(_ text: String) -> String {
    let vowels = "aeiou"
    var result = ""
    for char in text {
            if !vowels.contains(char) && !vowels.uppercased().contains(String(char)){
            result.append(char)
        }
    }
    return result
}

print(removeVowelsManual("Beautiful Girl On The Beach"))


//Challenge 7: Count Frequency of Each Character
//Given a string, count how many times each character appears.

//let input = "hello"
//["h": 1, "e": 1, "l": 2, "o": 1] // output

//Solution 1: Using Dictionary + for-in Loop (Efficient & Clean)

func countCharacters(_ text: String) -> [Character: Int] {
    var frequency: [Character: Int] = [:]
    for char in text {
        frequency[char, default: 0] += 1
    }
    return frequency
}
print(countCharacters("hello"))

//Manual Solution
func countCharFrequency(_ input: String) -> [Character: Int] {
    
    var result : [Character:Int] = [:]
    for char in input {
        if let existingCount = result[char] {
            result[char] = existingCount + 1
        }
        else {
            result[char] = 1
        }
    }
    return result
}

print(countCharFrequency("hello"))

//Solution 2: Case-Insensitive Version

func countCharactersIgnoringCase(_ text: String) -> [Character: Int] {
    let lowered = text.lowercased()
    let noSpaces = lowered.replacingOccurrences(of: " ", with: "")
    print("=> \(noSpaces)")
    var result: [Character: Int] = [:]

    for char in noSpaces {
        result[char, default: 0] += 1
    }

    return result
}
print(countCharactersIgnoringCase("Hello Friend"))

//Solution 4: Ignore Spaces or Digits (Custom Filter)

func countDigitsOnly(_ text: String) -> ([Character: Int] , Int){
    var result: [Character: Int] = [:]
    var count = 0
    for char in text where char.isLetter {
        result[char, default: 0] += 1
        count += 1
    }
    return (result, count)
}
let result = countDigitsOnly("Hello123 World456")
print(result.0)
print(result.1)


// Challenge 8: Find the First Non-Repeating Character
//Given a string, return the first character that appears only once in the entire string.

func firstNonRepeatingCharacter(_ input: String) -> Character? {
    var charCount: [Character: Int] = [:]
    
    for char in input {
        charCount[char, default: 0] += 1
    }
    
    for (char, count) in charCount {
        if count == 1 {
            return char
        }
    }
    return nil
}

print(firstNonRepeatingCharacter("hello") ?? "Nil")
print(firstNonRepeatingCharacter("abacabad") ?? "Nil")
print(firstNonRepeatingCharacter("aabbb") ?? "Nil")

//Manual solution

func findfirstNonRepeatingChar(_ input: String) -> Character? {
    
    var result: [Character: Int] = [:]
    let array = Array(input)
    
    for i in 0..<array.count {
        let char = array[i]
        if let count = result[char]{
            result[char]! += 1
        }
        else{
            result[char] = 1
        }
    }
    
    for i in 0..<array.count{
        if result[array[i]] == 1{
            return array[i]
        }
    }
    return nil
}

print(findfirstNonRepeatingChar("abacabad") ?? "Nil")
 
// Challenge 9: Convert a String to Title Case
//Convert a sentence so that each word starts with a capital letter and the rest of the letters are lowercase.
//"hello world from swift"
//"Hello World From Swift"

func capitalizedFirstLetterOfEachWord(_ str: String) -> String {
    return str.split(separator: " ").map({ String($0).capitalized }).joined(separator: " ")
}
print(capitalizedFirstLetterOfEachWord("hello world from swift"))
print(capitalizedFirstLetterOfEachWord("i love swift"))
print(capitalizedFirstLetterOfEachWord("swift-programming"))
 
func titleCaseNoSplit(_ text: String) -> String {
    var result = ""
    var isNewWord = true

    for char in text {
        if char == " " {
            result.append(char)
            isNewWord = true
        } else {
            if isNewWord {
                result.append(char.uppercased())
                isNewWord = false
            } else {
                result.append(char.lowercased())
            }
        }
    }

    return result
}
print(titleCaseNoSplit("hello world from swift"))

//🔁 Challenge 10: Replace Substring with Another

// Problem
//Given a string, replace all occurrences of a specific word or substring with a new one.

func replaceSubstring(_ text: String, old: String, new: String) -> String {
    return text.replacingOccurrences(of: old, with: new)
}

print(replaceSubstring("Hello World", old: "World", new: "Swift"))
 
func replaceWord(_ inputString: String, _ wordToReplace: String, _ replacement: String) -> String {
    
    let words = inputString.split(separator: " ")
    var resultString = ""
    
    for words in words {
        if words.lowercased() == wordToReplace.lowercased() {
            resultString += replacement + " "
        } else {
            resultString += "\(words) "
        }
    }
    return resultString.trimmingCharacters(in: .whitespaces)
}
print(replaceWord("Hello World", "World", "Swift"))

func replaceWordManual(_ text: String, old: String, new: String) -> String {
    let words = text.split(separator: " ")
    var result: [String] = []

    for word in words {
        if word == old {
            result.append(new)
        } else {
            result.append(String(word))
        }
    }

    return result.joined(separator: " ")
}
print(replaceWordManual("Hello World", old: "World", new: "Swift"))

///✅ Solution 3: Character-by-Character (Advanced Practice)


func replaceSubstringManual(_ text: String, old: String, new: String) -> String {
    var result = ""
    var i = text.startIndex

    while i < text.endIndex {
        if text[i...].hasPrefix(old) {
            result += new
            i = text.index(i, offsetBy: old.count)
        } else {
            result.append(text[i])
            i = text.index(after: i)
        }
    }

    return result
}

print(replaceSubstringManual("swiftly-xcodes swiftxcode is swift-code.",
                             old: "swift",
                             new: "xcode"))
