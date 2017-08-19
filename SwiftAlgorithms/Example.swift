//
//  Example.swift
//  Swift_algorithms
//
//  Created by Vivian Liu on 6/25/17.
//  Copyright © 2017 Vivian Liu. All rights reserved.
//

//
//  Example.swift
//  Swift_algorithms
//
//  Created by Vivian Liu on 6/25/17.
//  Copyright © 2017 Vivian Liu. All rights reserved.
//

import Foundation
struct Example {
    //Expand the Sequence
    func panlindrome(sequence: [Int]) -> [Int] {
        var result = [Int]()
        for i in 0..<sequence.count {
            var j = 1
            if i != 0 {
                j = 2
            }
            while j < sequence[i]{
                result.append(j)
                j += 1
            }
            while j >= 1 {
                result.append(j)
                j -= 1
            }
        }
        return result
    }
    
    //Print the first N primes
    func isPrime(_ number: Int) -> Bool {
        if number == 1 {return false}
        if number == 2 {return true}
        else {
            for i in 2..<number {
                if number % i == 0 {
                    return false
                }
            }
            return true
        }
    }
    
    func getTheFirstNPrimes(_ n: Int) -> [Int] {
        var count = 0
        var primes = [Int]()
        var number = 1
        while count < n {
            if isPrime(number) {
                primes.append(number)
                count += 1
            }
            number += 1
        }
        return primes
    }
    
    //Find the greatest common divisor
    func greatestCommonDivisor(_ a: Int, _ b: Int) -> Int {
        var x = a
        var y = b
        while y != 0 {
            let t = y
            y = x % y
            x = t
        }
        return x
    }
    
    //Find the least common multiple of two numbers
    func leastCommonMultiple(_ a: Int, _ b: Int) -> Int {
        return a * b / greatestCommonDivisor(a, b)
    }
    
    //Find the least common multiple of N numbers
    func leastCommonMultiple(of numbers: [Int]) -> Int {
        while numbers.count > 2 {
            let subArray = Array(numbers[1..<numbers.count]) //convert ArraySlice to Array
            return leastCommonMultiple(numbers[0], leastCommonMultiple(of: subArray))
        }
        return leastCommonMultiple(numbers[0], numbers[1])
    }
    
    // Tipping
    func totalCost(mealCost: Double, tip: Int) -> Double {
        return mealCost * (1 + Double(tip) / 100)
    }
    
    // We have a series of sorted timestamped events of when a single user logs into their account. We want to know whether there exists any 30-day period in which the user has logged into their account 5 or more times.
    
    func hasFiveOrMoreInThirtyDays(sortedTimestamps timestamps: [Date]) -> Bool {
        if timestamps.count < 5 {
            return false
        }
        for i in 0..<timestamps.count - 4 {
            let aMonthLater = Date.init(timeInterval: 30 * 24 * 60 * 60, since: timestamps[i])
            if timestamps[i + 4] <= aMonthLater {
                return true
            }
        }
        return false
    }
    
    // Rounding
    func roundedNumber(of number: Double) -> Double {
        return round(number * 10) / 10
        // return Int(number * 10) / 10
    }
    
    // Above average
    func howIsYourGrade(with yourGrade: Double, grade1: Double, grade2: Double, grade3: Double) {
        let averageGrade = (grade1 + grade2 + grade3 + yourGrade) / 4
        if yourGrade > averageGrade {
            print ("above average")
        } else {
            print ("below average")
        }
    }
    
    // 3.6 Fields
    func totalHarvestedWheat(numberOfFields: Int, wheatField: Double, weatherWasGood: Bool) -> Double {
        var totalHarvestedWheat: Double = Double(numberOfFields) * wheatField
        if weatherWasGood {
            totalHarvestedWheat = totalHarvestedWheat * 1.5
        }
        return totalHarvestedWheat
    }
    
    // Transform a digit to the binary form
    func digitToBinary(number: Int) -> Int {
        var binary = 0
        var digit = 1
        var startNumber = number
        repeat {
            let reminder = number % 2
            binary = reminder * digit + binary
            digit *= 10
            startNumber = startNumber / 2
        } while startNumber > 0
        return binary
    }
    
    // 4.3 Print the powers of 2 that are less than or equal to N.
    func powersOf2(lessThan n: Int) {
        var power = 2
        while power <= n {
            print (power)
            power *= 2
        }
    }
    
    // 4.4 Alternative Counting
    func  alternativeCountingFrom1To(N: Int) {
        for i in (1...(N + 1)/2) {
            let end = 1 + N - i
            print (i)
            if i != end {
                print (end)
            }
        }
    }
    
    // 4.5 Given an integer N draw a square of N x N asterisks. Look at the examples.
    func drawSquareAsterisks(side: Int) {
        for _ in 1...side {
            for _ in 1...side {
                print("*",terminator: "")
            }
            print ("")
        }
    }
    
    // 4.7 Given an integer N draw a triangle of asterisks. The triangle should have N lines, the i-th line should have iasterisks on it.
    func drawTriangle(lines: Int) {
        for i in 1...lines {
            for _ in 1...i {
                print("*",terminator: "")
            }
            print("")
        }
    }
    
    // 4.8 Given an integer N draw a pyramid of asterisks. The pyramid should have N lines. On the i-th line there should be N-i spaces followed by i*2-1 asterisks.
    func drawPyramid(lines: Int) {
        for i in 1...lines {
            for _ in 0...(lines - i){
                print(" ", terminator: "")
            }
            for _ in 1...(i * 2 - 1) {
                print("*", terminator: "")
            }
            print("")
        }
    }
    
    // 4.9 Given an integer N draw a rhombus of asterisks, like the ones in the examples.
    func drawRhombus(halfLines: Int) {
        for i in 1...halfLines {
            for _ in 0...(halfLines - i){
                print(" ", terminator: "")
            }
            for _ in 1...(i * 2 - 1) {
                print("*", terminator: "")
            }
            print("")
        }
        if halfLines > 1 {
            for j in 1...halfLines - 1 {
                let i = halfLines - j
                for _ in 0...j {
                    print(" ", terminator: "")
                }
                for _ in 1...(2 * i - 1) {
                    print("*", terminator: "")
                }
                print("")
            }
        }
    }
    
    // 4.11 Given an integer N draw a chess board of size N x N. Each line of the chess board should have spaces and number signs(#) alternating. A space represents a white cell and the number sign a black one. The chess board should be bordered using +, - and | like in the examples below.
    func drawChessBoard(sideCells: Int) {
        //print up boarder
        print ("+", terminator: "")
        for _ in 1...sideCells {
            print ("-",  terminator: "")
        }
        print ("+")
        
        // print chess
        for i in 1...sideCells {
            print ("|",  terminator: "")
            for j in 1...sideCells {
                if (i % 2 == j % 2) {
                    print ("#", terminator: "")
                }
                else {
                    print (" ", terminator: "")
                }
            }
            print ("|")
        }
        
        // print bottom boarder
        print ("+",  terminator: "")
        for _ in 1...sideCells {
            print ("-",  terminator: "")
        }
        print ("+")
    }
    
    //4.12  Write a program that prints the first N Fibonacci numbers. The first two Fibonacci numbers are 1, the rest of the elements are the sum of the previous two. The first seven numbers are 1, 1, 2, 3, 5, 8 and 13.
    func getFibonacciNumber(ith: Int) -> Int {
        if ith == 1 || ith == 2 {
            return 1
        }
        return getFibonacciNumber(ith: ith - 1) + getFibonacciNumber(ith: ith - 2)
    }
    
    func printFibonacciNumber(of first: Int) {
        var a = 0
        var b = 1
        for _ in 1...first {
            print (b)
            let temp = a
            a = b
            b = temp + b
        }
        
    }
    
    // 4.13 Leap Years Write a program that prints the next N leap years starting with leapYear.
    func nextNLeapYears (starting from: Int, numbers: Int) {
        var year = from
        for _ in 1...numbers {
            if year % 100 != 0 || year % 400 == 0 {
                print (year)
            }
            year += 4
        }
    }
    
    // 4.14 You are given a number. Print the number with the digits in reversed order.
    func reverse(number: Int) {
        var numberCopy = number
        while numberCopy != 0 {
            print("\(numberCopy % 10)", terminator: "")
            numberCopy /= 10
        }
    }
    func reverse2(number: Int) -> Int {
        var numberCopy = number
        var reverse = 0
        while numberCopy != 0 {
            reverse = reverse * 10 + numberCopy % 10
            numberCopy /= 10
        }
        return reverse
    }
    
    
    // 4.15 You are given two numbers a and b. Find and print the greatest common divisor of a and b.
    func theGreatestCommonDivisor(of a: Int, and b: Int) -> Int {
        if a * b == 0 {return a == 0 ? b : a}
        if a == b {return a}
        let maxGCD = a < b ? a : b
        var GCD = 1
        for i in 2...maxGCD {
            if a % i == 0 && b % i == 0 {
                GCD = i
            }
        }
        return GCD
    }
    
    // 4.16 You are given a number. Print "prime" if the number is a prime and "not prime" otherwise.
    // A number is a prime if it has exactly 2 distinct divisors (1 and itself).
    func isPrime(number: Int) {
        var numberOfDivisors = 0
        for i in 1...number {
            if number % i == 0 {
                numberOfDivisors += 1
            }
        }
        if numberOfDivisors == 2 {
            print ("prime")
        } else {
            print ("not prime")
        }
    }
    
    // 4.17 You are given a number. Decompose number into prime factor and write it as an expression.
    func primeFactoring(number: Int) -> [Int] {
        var numberCopy = number
        var primeFactors = [Int]()
        var factor = 2
        while numberCopy != 1 {
            if isPrime(factor) && numberCopy % factor == 0 {
                primeFactors.append(factor)
                numberCopy = numberCopy / factor
            } else {
                factor += 1
            }
        }
        return primeFactors
    }
    
    func primeFactoring2(number: Int) {
        var numberCopy = number
        var factor = 2
        print ("\(number) = ", terminator: "")
        while numberCopy != 1 {
            if isPrime(factor) && numberCopy % factor == 0 {
                numberCopy = numberCopy / factor
                print ("\(factor)", terminator: numberCopy == 1 ? "" : " * ")
                
            } else {
                factor += 1
            }
        }
    }
    
    //4.18 Find all numbers free of squares less than or equal to N. A number is free of square if it cannot be divided by any square number except 1.
    func freeOfSquares(number: Int) -> [Int] {
        var allFreeofSquares = [Int]()
        for n in 1...number {
            var isFreeOfSquare = true
            for i in 2..<number {
                if n % (i * i) == 0 {
                    isFreeOfSquare = false
                    break
                }
            }
            if isFreeOfSquare {
                allFreeofSquares.append(n)
            }
        }
        return allFreeofSquares
    }
    
    // 5.3 You are given a string stored in the variable aString. Create new string named replacedString that contains the characters of the original string with all the occurrences of the character "e" replaced by "*".
    func replace(_ string: String, replace original: Character, by: Character ) -> String {
        var newString = ""
        for c in string.characters {
            if c == original {
                newString += "\(by)"
            } else {
                newString += "\(c)"
            }
        }
        return newString
    }
    
    // 5.4 You are given a string stored in variable aString. Create a new string called reverse that contains the original string in reverse order. Print the reversed string.
    func reverse(string: String) -> String {
        let reversed = String(string.characters.reversed())
        return reversed
    }
    
    func reverse2(string: String) -> String {
        var reversed = ""
        for c in string.characters.reversed() {
            reversed += "\(c)"
        }
        return reversed
    }
    
    // 5.5 Print true if aString is a palindrome, and false otherwise. A palindrome is a string which reads the same backward or forward.
    func isPanlindrome(aString: String) -> Bool {
        let count = aString.characters.count
        let charactersArray = Array(aString.characters)
        var i = 0
        var j = count - 1
        while i < j {
            if charactersArray[i] != charactersArray[j] {
                return false
            }
            i += 1
            j -= 1
        }
        return true
    }
    
    func isPanlindrome2(aString: String) -> Bool {
        if aString == String(aString.characters.reversed()) {
            return true
        } else {
            return false
        }
    }
    
    // 5.6 Split a string into words and print them on separate line
    func splitIntoWords(aString: String) {
        var word = ""
        for c in aString.characters {
            if "\(c)" != " " {
                word += "\(c)"
            } else {
                print(word)
                word = ""
            }
        }
        print(word)
    }
    
    // 5.7 Find the longest word in the problem description
    func findTheLongestWord(aString: String) -> String {
        var longest = ""
        var word = ""
        var max = 0
        var length = 0
        for c in aString.characters {
            if "\(c)" != " " {
                word += "\(c)"
                length += 1
            } else {
                if length > max {
                    max = length
                    longest = word
                }
                word = ""
                length = 0
            }
        }
        if length > max {
            max = length
            longest = word
        }
        return longest
    }
    
    // 5.8 By using only one print() statement draw a rectangle of size N x M out of asterisks.
    
    
    func drawAsterisks(row: Int, column: Int) {
        
        print(("*" * column + "\n") * row)
        
    }
    
    // 6.4 Print all the numbers from listOfNumbers that are located at odd indexes.
    func oddIndexes(of array: [Int]) {
        for i in 0..<array.count {
            if i % 2 != 0 {
                print(array[i])
            }
        }
    }
    
    // 6.5 Print the numbers from listOfNumbers in reverse order on separate lines.
    func reverse1(array: [Int]) {
        for n in array.reversed() {
            print(n)
        }
    }
    
    func reverse2(array: [Int]) {
        for i in stride(from: array.count - 1, to: -1, by: -1) {
            print(array[i])
        }
    }
    
    func reverse3(array: [Int]) {
        var i = array.count - 1
        while i >= 0 {
            print(array[i])
            i -= 1
        }
    }
    
    // 6.6 Reverse the order of the elements in listOfNumbers without creating any additional arrays.
    func reverseInPlace(array: [Int]) {
        var arrayCopy = array
        var i = 0
        var j = arrayCopy.count - 1
        while i < j {
            let temp = arrayCopy[i]
            arrayCopy[i] = arrayCopy[j]
            arrayCopy[j] = temp
            i += 1
            j -= 1
        }
    }
    
    // 6.7 Sort the values in listOfNumbers in descending order.
    func sortInDescendingOrder(array: [Int]) -> [Int] {
        return array.sorted(by: >)
    }
    
    // 6.8 Find out if x appears in listOfNumbers. Print yes if true and no otherwise.
    func search(x: Int, in array: [Int]) -> Bool {
        let sortedArray = array.sorted()
        var lowIndex = 0
        var highIndex = sortedArray.count - 1
        while lowIndex <= highIndex {
            let midIndex = (lowIndex + highIndex) / 2
            if sortedArray[midIndex] == x {
                return true
            } else if x < sortedArray[midIndex] {
                highIndex = midIndex - 1
            } else {
                lowIndex = midIndex + 1
            }
        }
        return false
        
    }
    
    // 6.9 Print all the elements from otherNumbers that appear in listOfNumbers. Don’t print anything if listOfNumbers andotherNumbers have no common elements.
    func intersection(of array1: [Int], and array2: [Int]) {
        for i in array1 {
            if search(x: i, in: array2) {
                print(i)
            }
        }
        print("done")
    }
    
    // 6.10 Print all the numbers from listOfNumbers that are divisible by at least one number from divisors.
    func findAllDivisibleNumbers(listOfNumbers: [Int], divisors: [Int]) {
        for n in listOfNumbers {
            for d in divisors {
                if n % d == 0 {
                    print(n)
                    break
                }
            }
        }
    }
    
    // 6.11 Find and print the greatest common divisor of all the numbers in numbers. A common divisor of a list of numbers is a number that divides all of them.
    func greatestCommonDivisor(listOfNumbers: [Int]) -> Int {
        var minGCD = 1
        let maxGCD = listOfNumbers.min()!
        if maxGCD == 1 {
            return 1
        }
        
        for i in 2...maxGCD{
            var isCommonDivisor = true
            for n in listOfNumbers {
                if n % i != 0 {
                    isCommonDivisor = false
                    break
                }
            }
            if isCommonDivisor && i > minGCD {
                minGCD = i
            }
        }
        return minGCD
    }
    
    // 6.12 Generate the first N numbers in the fibonacci sequence. Store them in an array named fibonacci and print them one on each line.
    func fibonacci(count: Int) -> [Int] {
        var fibonacci = [Int]()
        var a = 0
        var b = 1
        for _ in 1...count {
            fibonacci.append(b)
            print(b)
            let temp = a
            a = b
            b += temp
        }
        return fibonacci
    }
    
    //6.13 Given a number find and store all it’s divisors in an array called divisors, then print the divisors in ascending order on separate lines.
    func allDivisors(of number: Int) -> [Int] {
        var allDivisors = [Int]()
        for i in 1...number {
            if number % i == 0 {
                allDivisors.append(i)
                print(i)
            }
        }
        return allDivisors
    }
    
    // 6.14 Find and store the digits of number from left to right in an array digits, and then print the digits on separate lines.
    func digits(of number: Int) -> [Int] {
        var arrayOfDigits = [String]()
        for c in String(number).characters {
            arrayOfDigits.append(String(c))
        }
        return arrayOfDigits.map({Int($0)!})
    }
    
    func digits2(of number: Int) -> [Int] {
        var arrayOfDigits = [Int]()
        var numberCopy = number
        if number == 0 {
            arrayOfDigits = [0]
        } else {
            while numberCopy != 0 {
                let lastDigit = numberCopy % 10
                numberCopy /= 10
                arrayOfDigits.insert(lastDigit, at: 0)
            }
            
        }
        arrayOfDigits.forEach({print($0)})
        return arrayOfDigits
    }
    
    // 6.15 Create a list unique with all the unique numbers from listOfNumbers, and then print the numbers on separate lines.
    func uniqueNumbers(of listOfNumbers: [Int]) {
        let uniqueNumbers = Set(listOfNumbers)
        uniqueNumbers.forEach({print($0)})
    }
    
    func uniqueNumbers2(of listOfNumbers: [Int]) {
        var uniqueNumbers = [Int]()
        listOfNumbers.forEach({if !uniqueNumbers.contains($0) {uniqueNumbers.append($0)}})
        uniqueNumbers.forEach({print($0)})
        
    }
    
    // 7.3 Write a function named first that takes an Int named N and returns an array with the first N numbers starting from 1. Use _ to ignore the external parameter name.
    func first(_ N: Int) -> [Int] {
        var array = [Int]()
        (1...N).forEach {array.append($0)}
        return array
    }
    
    // 7.4 Write a function named countdown that takes a number N. The function should print the numbers from N to 1 with a one second pause in between and then write GO! in the end.
    func countdown(_ N: Int) {
        (1...N).reversed().forEach {print($0)}
        sleep(1)
        print("GO!")
    }
    
    // 7.5 Implement the following functions. The divides function returns true if a is divisible by b and false otherwise. The countDivisors function should use the divides function to return the number of divisors of number. TheisPrime function should use the countDivisors function to determine if number is prime.
    func divides(_ a: Int, by b: Int) -> Bool {
        return a % b == 0
    }
    
    func countDivisors(of number: Int) -> Int {
        var count = 0
        for i in 1...number {
            if divides(number, by: i) {
                count += 1
            }
        }
        return count
    }
    
    func isPrime4(_ number: Int) -> Bool {
        return countDivisors(of: number) == 2
    }
    
    // 7.6 Using isPrime write a function named printFirstPrimes that takes a parameter named count of type Int that prints the first count prime numbers.
    func printFirstPrimes(count: Int) {
        var c = 0
        var number = 2
        while c < count {
            if isPrime(number) {
                print(number)
                c += 1
            }
            number += 1
        }
    }
    
    // 7.7 Implement a function named repeatPrint that takes a string message and a integer count as parameters. The function should print the message count times and then print a newline.
    func repeatPrint(message: String, count: Int) {
        print(message * count)
    }
    
    func repeatPrint2(message: String, count: Int) {
        var count = count
        while count > 0 {
            print(message, terminator: "")
            count -= 1
        }
        print("\n")
    }
    
    // 7.8 Write a function named reverse that takes an array of integers named numbers as a parameter. The function should return an array with the numbers from numbers in reverse order.
    func reverse(numbers: [Int]) -> [Int] {
        var reversedArray = [Int]()
        var i = numbers.count - 1
        while i >= 0 {
            reversedArray.append(numbers[i])
            i -= 1
        }
        return reversedArray
    }
    
    func reverse2(numbers: [Int]) -> [Int] {
        var reversedArray = [Int]()
        for number in numbers {
            reversedArray.insert(number, at: 0)
        }
        return reversedArray
    }
    
    // 7.9 Write a function named sum that takes an array of integers and returns their sum.
    func sum(of integers: [Int]) -> Int {
        let sum = integers.reduce(0, +)
        return sum
    }
    
    //7.10 Write a function named parse(digit:) that takes a string with one character as parameter. The function should return -1 if the input is not a digit character and the digit otherwise.
    func parse(digit: String) -> Int {
        return Int(digit) ?? -1
    }
    
    //isNumber that takes an arbitrary length string and return true if the string contains only digits and falseotherwise.
    func isNumber(_ string: String) -> Bool {
        return Int(string) != nil ? true:false
    }
    
    // Using the isNumber and parse(digit:) functions, write a function named parse(number:) that takes a string and returns it’s values as an integer or -1 if the string does not contain only digits.
    func parse(number: String) -> Int {
        var result = 0
        if !isNumber(number) {
            return -1
        }
        for c in number.characters {
            result = result * 10 + parse(digit: String(c))
        }
        return result
    }
    
    // 7.11 Write a function named timeDifference. It takes as input four numbers that represent two times in a day and returns the difference in minutes between them. The first two parameters firstHour and firstMinute represent the hour and minute of the first time. The last two secondHour and secondMinute represent the hour and minute of the second time. All parameters should have external parameter names with the same name as the local ones.
    func timeDifference(firstHour: Int,
                        firstMinute: Int,
                        secondHour: Int,
                        secondMinute: Int) -> Int {
        let difference = (secondHour * 60 + secondMinute) - (firstHour * 60 + firstMinute)
        return difference
    }
    
    // 7.12 Write a function named verify that takes a string expression of open and closed parentheses ((, )) and returnstrue if they are correctly paired and false otherwise.
    func verify(parentheses: String) -> Bool {
        var open = 0
        var closed = 0
        for p in parentheses.characters {
            if String(p) == "(" {
                open += 1
            } else {
                closed += 1
                if closed > open {
                    return false
                } //In a correct pairing the number of closed parentheses you encounter can never be greater than the number of open parentheses.
            }
        }
        return open == closed
    }
    
    // 7.13 Mario uses energy points to walk and jump. He can jump maximum maxJump meters up or down. You have the height of each 1 meter portion of a level in the heights array. Determine if Mario can finish the level and how much energy he needs to do it. Mario uses 1 energy point to walk one meter and 2 * jumpHeight energy points to jumpHeightmeters. Write a function named levelCost that takes heights and maxJump as parameters and returns -1 if Mario cannot finish the level or the total energy cost that he would need to finish the level. In the beginning Mario will be on the first 1 meter section of the level and the heights array will always have more than one element. All heights have a value greater or equal to 1.
    func levelCost(heights: [Int], maxJump: Int) -> Int {
        var start = 0
        var energyCost = 0
        while start < heights.count - 1 {
            if abs(heights[start + 1] - heights[start]) > maxJump {
                return -1
            }
            else {
                if heights[start + 1] == heights[start] {
                    energyCost += 1
                } else {
                    energyCost += abs(heights[start + 1] - heights[start]) * 2
                }
            }
            start += 1
        }
        return energyCost
    }
    
    // 7.14 Implement the push and pop operations of a queue.
    func push(element: Int, into queue: inout [Int]) {
        queue.append(element)
    }
    
    func pop(from queue: inout[Int]) -> Int? {
        let firstItem = queue.first // array.first returns an optional.
        if queue.count > 0 {
            queue.remove(at: 0)
        }
        return firstItem
    }
    
    // 7.15 A stack is a data structure that can perform three operations:
    
    //    push adds a value on the top of the stack
    //    top returns the value from the top of the stack
    //    pop returns the value from the top of the stack and removes it from there
    // Your task is to implement the push, top and pop operations.
    func push2(element: Int, into stack: inout [Int]) {
        stack.insert(element, at: 0)
    }
    
    func top(of stack: [Int]) -> Int? {
        return stack.first
    }
    
    func pop2(from stack: inout[Int]) -> Int? {
        let first = stack.first
        if stack.count > 0 {
            stack.remove(at: 0)
        }
        return first
    }
    
    //8.3 Implement a recursive function named digits that takes a positive integer number and return an array containing it’s digits in order.
    func digits(_ n: Int) -> [Int] {
        if n / 10 > 0 {
            return digits(n / 10) + digits(n % 10)
        }
        return [n]
    }
    
    //8.4 Write a recursive function pow that takes two numbers x and y as input and returns x to the power y.
    func pow(_ base: Int, _ power: Int) -> Int {
        if power > 0 {
            return base * pow(base, power - 1)
        }
        return 1
    }
    
    //8.5 Implement the Euclidian algorithm for getting the greatest common divisor of two numbers by using repeated subtractions.
    func gcd(_ a: Int, _ b: Int) -> Int {
        if a * b == 0 {
            return a == 0 ? b : a
        }
        if a >= b {
            return gcd(a - b, b)
        } else {
            return gcd(a, b - a)
        }
        
    }
    
    // 8.6 Binary search
    func search(_ key: Int, in numbers: [Int], lowIndex: Int = 0, highIndex: Int = -1) -> Bool {
        var highIndex = highIndex
        if highIndex == -1 {
            highIndex = numbers.count - 1
        }
        if lowIndex > highIndex {
            return false
        }
        let midIndex = (lowIndex + highIndex) / 2
        if numbers[midIndex] == key {
            return true
        } else {
            if numbers[midIndex] > key {
                return search(key, in: numbers, lowIndex: lowIndex, highIndex: midIndex - 1)
            } else {
                return search(key, in: numbers, lowIndex: midIndex + 1, highIndex: highIndex)
            }
        }
        
    }
    
    // 8.7 Towers of Hanoi
    //    To move N disks from a peg A to peg B, you must first move N-1 disks from peg A to peg C, then move the last disk from A onto B and finally move N-1 disks from C to B. In other words to solve the Hanoi(N) problem you must first solve the Hanoi(N-1) problem two times. When you only have to move one disk you can just make the move.
    
    func hanoi(_ N: Int,
               from firstPeg: String = "A",
               to secondPeg: String = "B",
               using thirdPeg: String = "C") {
        if N == 1 {
            print("moves from \(firstPeg) to \(secondPeg)")
        } else {
            hanoi(N-1, from: firstPeg, to: thirdPeg, using: secondPeg)
            hanoi(1, from: firstPeg, to: secondPeg, using: thirdPeg)
            hanoi(N-1, from: thirdPeg, to: secondPeg, using: firstPeg)
        }
    }
    
    //9.4 Join all the strings from strings into one using reduce. Add spaces in between strings. Print your result.
    func joinStrings(_ strings: [String]) -> String {
        let joint = strings.reduce("") {$0 + " " + $1}
        return joint
    }
    
    // 9.5 Sort numbers in ascending order by the number of divisors. If two numbers have the same number of divisors the order in which they appear in the sorted array does not matter.
    func sortByNumberOfDivisors(_ numbers: [Int]) -> [Int] {
        return numbers.sorted { (x, y) -> Bool in
            func countDivisors(n: Int) -> Int {
                var count = 0
                for i in 1...n {
                    if n % i == 0 {
                        count += 1
                    }
                }
                return count
            }
            return countDivisors(n: x) < countDivisors(n: y) // whyl <= returns a different order?
        }
    }
    
    func sortByNumberOfDivisors2(_ numbers: [Int]) -> [Int] {
        return numbers.sorted{
            countDivisors(of: $0) < countDivisors(of: $1)
        }
    }
    
    // 9.6 Find the sum of the squares of all the odd numbers from numbers and then print it. Use map, filter and reduce to solve this problem.
    func sumOfOddSquare(from numbers: [Int]) -> Int {
        //        let oddNumbers = numbers.filter { $0 % 2 == 1 }
        //        let squareOfOddNumbers = oddNumbers.map { $0 * $0 }
        //        return squareOfOddNumbers.reduce(0, +)
        return numbers.filter {$0 % 2 == 1}.map{$0 * $0}.reduce(0, +)
    }
    
    // 9.7 Implement a function forEach(array: [Int], _ closure: Int -> ()) that takes an array of integers and a closure and runs the closure for each element of the array.
    func forEach(array: [Int], _ closure: (Int) -> ()) {
        for i in array {
            closure(i)
        }
    }
    
    // 9.8 Implement a function combineArrays that takes 2 arrays and a closure that combines 2 Ints into a single Int. The function combines the two arrays into a single array using the provided closure. Assume that the 2 arrays have equal length.
    func combineArrays(array1: [Int], array2: [Int], _ closure: (Int, Int) -> Int) -> [Int] {
        var combined = [Int]()
        let n = array1.count
        for i in 0...n - 1 {
            combined.append(closure(array1[i], array2[i]))
        }
        return combined
        
    }
    
    // 10.3 1) Define an enumeration named HandShape with three members: .rock, .paper, .scissors.
    // 2) Define an enumeration named MatchResult with three members: .win, .draw, .lose.
    // 3) write a function called match that takes two hand shapes and returns a match result. It should return the outcome for the first player (the one with the first hand shape).
    
    enum HandShape: Int {
        case rock = 1 //1
        case paper //2
        case scissors //3
    }
    
    enum MatchResult {
        case win
        case draw
        case lose
    }
    
    func match(first: HandShape, second: HandShape) -> MatchResult {
        switch first.rawValue - second.rawValue {
        case 0: return .draw
        case -1: return .lose
        case 2: return .lose //scissors and rock
        default: return .win
        }
        
        
    }
    
    // 10.4 You are given 2 tuples of a, b type (Int,Int) representing fractions. The first value in the tuple represents the numerator, the second value represents the denominator. Create a new tuple sum of type (Int,Int) that holds the sum of the fractions.
    func sumOfFractions(_ a: (Int, Int), _ b: (Int, Int)) -> (Int, Int) {
        var sum = (numerator: 0, denominator: 0)
        sum.numerator = a.0 * b.1 + b.0 * a.1
        sum.denominator = a.1 * b.1
        return sum
    }
    
    // 10.5 You are given the CoinType enumeration which describes different coin values and moneyArray which has tuples(ammount, coinType). Print the total value of the coins in the array.
    enum CoinType: Int {
        case penny = 1
        case nickle = 5
        case dime = 10
        case quarter = 25
        
    }
    
    func totalValue(_ moneyArray: [(amount: Int, coinType: CoinType)]) -> Int {
        var sum = 0
        for money in moneyArray {
            sum += money.amount * money.coinType.rawValue
            
        }
        return sum
    }
    
    // 10.6 You are given an array of strings stored in the variable strings. Create a new array named countedStringscontaining values of type (String,Int). Each tuple contains a string from the strings array followed by an integer indicating how many times it appears in the strings array. Each string should only appear once in thecountedStrings array.
    
    func countString(_ strings: [String]) -> [(String, Int)] {
        var countedStrings = [(string: String, count: Int)]()
        for string in strings {
            var found = false
            for i in 0..<countedStrings.count {
                if countedStrings[i].string == string {
                    found = true
                    countedStrings[i].count += 1
                    break
                }
            }
            if !found {
                countedStrings.append((string, 1))
            }
        }
        return countedStrings
    }
    
    // 10.7 You are given an array of integers. Find out the frequency of each one.
    // The frequency of a number is the number of times it appears in the array.
    // Print the numbers in ascending order followed by their frequency.
    func frequency(_ numbers: [Int]) {
        var frequency = [Int: Int]()
        for number in numbers {
            if frequency[number] != nil {
                frequency[number]! += 1
            } else {
                frequency[number] = 1
            }
        }
        let sortedFrequency = frequency.sorted { $0.0 < $1.0}
        sortedFrequency.forEach { print("\($0.0) " + "\($0.1)")}
        
    }
    
    func angleOfClockHands(hour: Int, minute: Int) -> Int {
        let hour = hour < 12 ? hour : hour - 12
        let PositionOfHourHand = (Double(hour) + Double(minute) / 60.0) * 30 // 30 per hour
        let PositionOfMinuteHand = Double(minute) * 6 // 6 per minute
        let angleOfClockHands = abs(PositionOfMinuteHand - PositionOfHourHand)
        let returnValue = angleOfClockHands <= 180 ? Int(round(angleOfClockHands)) : Int(round(360 - angleOfClockHands))
        return returnValue
    }
    
    func reverseString(_ list: String) -> String {
        let reversed = String(list.characters.reversed())
        return reversed
    }
    
    // You are given an array recipes containing a list of cooking recipes. Find the recipes containing a key ingredient keyword. Example: beef, eggs, etc.
    func findIngredient(in recipes: [String], ingredient: String) -> [String] {
        var result = [String]()
        for recipe in recipes {
            if recipe.lowercased().contains(ingredient.lowercased()) {
                result.append(recipe)
            }
        }
        return result
        
    }
    
    //Compute 2 to the power of n recursively and print it.
    func power2(_ power: Int) -> Int {
        while power > 0 {
            return 2 * power2(power - 1)
        }
        return 1
    }
    
    //For a given n and m, compute the sum sigma = 1^n + 2^n + 3^n + ... + m^n and print it.
    func sumOfPowers(count: Int, power: Int, f: (Int, Int) -> Int) -> Int {
        var sum = 0
        for i in 1...count {
            sum += f(i, power)
        }
        return sum
    }
    
    //Compute the number e = 1 + 1/1 + 1/1*2 + 1/1*2*3 + ... + 1/1*2*3*...*n.
    func factorial(_ n: Int) -> Int {
        if n == 1 {
            return 1
        } else {
            return factorial(n - 1) * n
        }
    }
    
    func eulerNumber2 (_ n: Int) -> Double {
        let eulerNumber = (1...n).map{1.0 / Double(factorial($0))}.reduce(1.0, + )
        return eulerNumber
    }
    
    func eulerNumber(_ n: Int) -> Double {
        var sum = 1.0
        for i in (1...n) {
            sum += 1.0 / Double(factorial(i))
        }
        return sum
    }
    
    // find the unique number in an array.
    func findTheUnique(in array: [Int]) -> Int {
        var newArray = [Int]()
        for n in array {
            if !newArray.contains(n) {
                newArray.append(n)
            } else {
                newArray.remove(at: newArray.index(of: n)!)
            }
        }
        return newArray.count > 0 ? newArray[0] : 0
    }
    
    // Write an algorithm that accepts a list of hotel rooms and    returns a list of hotel rooms sorted by price and grouped by room codes.    A hotel room has two properties a room code and a price.    Requirements:        1. The cheapest room should be first in the list.        2. Rooms with the same room code should be grouped together sorted by price.
    
//    For example,    INPUT: { [C, $100], [A, $75], [B, $25], [C, $50], [B, $175] }
//    OUTPUT: { [B, $25],              [B, $175],               [C, $50],               [C, $100],               [A, $75]             }
    
//    func sortHotel(list: [(String, Int)]) -> [(String, Int)] {
//        var hotelDictionary = [String : [Int]]()
//        for room in list {
//            if hotelDictionary[room.0] != nil {
//                hotelDictionary[room.0]!.append(room.1)
//            } else {
//                hotelDictionary[room.0] = [room.1]
//            }
//        }
//        let sortedHotelDictionary = hotelDictionary.sorted {$0.value.min()! < $1.value.min()! }
//        
//    
//    }

 
    
 //  Give you an array of integer, perform specified opertaitons. Return an array of integer.
    
    func sumTripple(_ list: [Int]) -> [Int] {
        
        var sumList = [Int]()
        if list.count >= 3 {
            for i in 0...list.count - 3 {
                let sum = list[i] + list[i + 1] + list[i + 2]
                sumList.append(sum)
            }
        }
        return sumList
    }
    
    func sum(_ list: [Int], _ n: Int) -> [Int] {
        var sumList = [Int]()
        if list.count >= n {
            for i in 0...list.count - n {
                var sum = 0
                for j in i...i+n-1 {
                    sum += list[j]
                }
                sumList.append(sum)
            }
        }
        return sumList
    }
    
    func multiply(_ list: [Int], _ n: Int) -> [Int] {
        var multiplyList = [Int]()
        if list.count >= n {
            for i in 0...list.count - n {
                var product = 1
                for j in i...i+n-1 {
                    product *= list[j]
                }
                multiplyList.append(product)
            }
        }
        return multiplyList
    }

    // write a generic function that can be appiled to any two operators operation.
    func accumulate(_ list: [Int], _ n: Int, _ operation:(Int, Int) -> Int) -> [Int] {
        var resultList = [Int]()
        if list.count >= n {
            for i in 0...list.count - n {
                var base = list[i]
                for j in i+1...i+n-1 {
                    base = operation(base, list[j])
                }
                resultList.append(base)
            }
        }
        return resultList
    }

    
    
}

func *(string: String, scalar: Int) -> String {
    let array = Array(repeating: string, count: scalar)
    return array.joined(separator: "")
}
