//: Playground - noun: a place where people can play

import UIKit

let life = [("Who will you go with?", ["mother", "father"]), ("Who will you marry?", ["Anna", "Elise", "Jean"])]
//let decision = life.count
//print (decision)
//var choices = 0
//var outcomes = 1
//for decision in life {
//    choices += decision.1.count
//    outcomes *= decision.1.count
//}
//print (choices)
//print (outcomes)


// your code here
let decisions = life.count
let choices = life.reduce(0){$0 + $1.1.count}
let outcomes = life.reduce(1){$0 * $1.1.count}
print("decisions = \(decisions)")
print("choices = \(choices)")
print("outcomes = \(outcomes)")



//Upside down
let textToPrint = ".nwod edispu ma I"
print (String(textToPrint.characters.reversed()))

//Peak Finding
let numbers = [1, 2, 3, 5, 9, 4, 3, 2, 1]
let maxNumber = numbers.max()!
let peak = numbers.index(of: maxNumber)

//Peak Counting
let mountains = [1, 2, 3, 2, 1, 3, 5, 2, 3, 1]
var peakNumbers = 0
for i in 1...mountains.count - 2 {
    if mountains[i] > mountains[i-1] && mountains[i+1] < mountains[i] {
        peakNumbers += 1
    }
}
print(peakNumbers)

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
let test = [2,3,2,4]
panlindrome(sequence: test)


//Print the first N primes
func isPrime(_ number: Int) -> Bool {
    if number == 1 || number == 2 {return true}
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
        }
        count += 1
        number += 1
    }
    return primes
}

getTheFirstNPrimes(5)


var i = 1
repeat {
    print(i)
    i = i + 1
} while i <= 10

// for loop in reversed order
for i in (1...10).reversed() {
    print(i)
}

// this is another way to use for loop in reversed order.
for i in stride(from: 10, to: 0, by: -1) {
    print (i)
}

let s = "Hello"
let o = s[s.index(s.startIndex, offsetBy: 4)]

// You are given an array recipes containing a list of cooking recipes. Find the recipes containing a key ingredient keyword. Example: beef, eggs, etc.
let recipes = ["Put eggs in a frying pan", "Cut the beef", "Boil the beef"]
let keyword = "beef"

// Greatest common divisor
func greatestCommonDivisor(_ a: Int, _ b: Int) -> Int {
    if a * b == 0 {
        return a == 0 ? b : a
    }
    if a >= b {
        return greatestCommonDivisor(a - b, b)
    }
    else {
        return greatestCommonDivisor(a, b - a)
    }
}

