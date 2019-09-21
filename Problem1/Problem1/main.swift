//
//  main.swift
//  Command Line Lesson
//
//  Created by Andrew on 9/7/19.
//  Copyright © 2019 Andrew Allen. All rights reserved.
//

import Foundation

typealias Byte = UInt8

class Program {
    
    func getManuallyTypedArray(withCount n: Int) -> [Byte] {
        var array = [Byte]()
        
        for _ in 0..<n {
            let newVal = Byte(readLine()!)!
            array.append(newVal)
        }
        
        return array
    }
    
    func getRandomlyGeneratedArray(withCount n: Int) -> [Byte] {
        var array = [Byte]()
        
        for _ in 0..<n {
            let newVal = Byte.random(in: Byte.min...Byte.max)
            array.append(newVal)
        }
        
        return array
    }
    
    func read(array: [Byte]) {
        for element in array {
            print(element, terminator: " ")
        }
    }
    
    func readBackward(array: [Byte]) {
        for i in 0..<array.count {
            let index = array.count - 1 - i
            print(array[index], terminator: " ")
        }
    }
    
    
    // Mark: - Additional methods
    
    func numberOfElementsWithDigitsLessThan(_ minDigitCount: Int, in array: [Byte]) -> Int {
        
        var wantedElementsCount = 0
        for i in 0..<array.count {
            var currentNumber = array[i]
            
            var digitCount = 0
            while currentNumber != 0 {
                digitCount += 1
                currentNumber /= 10
            }
            
            if digitCount < minDigitCount {
                wantedElementsCount += 1
            }
        }
        
        return wantedElementsCount
    }
    
    
    
    func isArraySymmetric(_ array: [Byte]) -> Bool {
        let sideElements = (array.count / 2)
        for i in 0..<sideElements {
            if array[i] != array[array.count - 1 - i] {
                return false
            }
        }
        
        return true
    }
    
    
    
    // Mark: - Main methods
    
    func main() {
        
        while true {
            print("Generate array randomly or type it manually?")
            print("1. Random input")
            print("2. Manual input")
            print("else: stop program")
            print("Your choice: ", terminator: "")
            
            let inputType = Int(readLine()!)!
            guard inputType == 1 || inputType == 2 else {
                break;
            }
            
            print("How many values?: ", terminator: "")
            guard let valuesCount = Int(readLine()!) else {
                continue
            }
            
            var array: [Byte]
            if inputType == 1 {
                array = getRandomlyGeneratedArray(withCount: valuesCount)
            } else {
                array = getManuallyTypedArray(withCount: valuesCount)
            }
            
            
            
            
            
            print("== Main routines ==")
            
            print("Array left-to-right: ", terminator: " ")
            read(array: array)
            
            print("")
            
            print("Array right-to-left: ", terminator: " ")
            readBackward(array: array)
            
            
            
            
            print("")
            print("== Additional functions == ")
            
            print("Minimum digit count: ", terminator: " ")
            guard let minDigitNum = Int(readLine()!) else {
                continue
            }
            let elementsCount = numberOfElementsWithDigitsLessThan(minDigitNum, in: array)
            print("There are \(elementsCount) elements with less than \(minDigitNum) digits")
            
            
            
            let isSymmetric = isArraySymmetric(array)
            print("The array is" + (isSymmetric ? " " : " not ") + "symmetric.")
            
            
            
            _ = readLine()
            print("\n")
            
        }
        
    }
}


Program().main()
