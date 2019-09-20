//
//  main.swift
//  Problem2
//
//  Created by Andrew on 9/20/19.
//  Copyright © 2019 Andrew Allen. All rights reserved.
//

import Foundation

class Program {

    
    
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
            
            var array: ByteArray
            if inputType == 1 {
                array = ByteArray.getRandomlyGeneratedArray(withCount: valuesCount)
            } else {
                array = ByteArray.getManuallyTypedArray(withCount: valuesCount)
            }
            
            
            
            
            
            print("== Main routines ==")
            
            print("Array left-to-right: ", terminator: " ")
            array.read()
            
            print("")
            
            print("Array right-to-left: ", terminator: " ")
            array.readBackward()
            
            
            
            
            print("")
            print("== Additional functions == ")
            
            print("Minimum digit count: ", terminator: " ")
            guard let minDigitNum = Int(readLine()!) else {
                continue
            }
            let elementsCount = array.numberOfElementsWithDigitsLessThan(minDigitNum)
            print("There are \(elementsCount) elements with less than \(minDigitNum) digits")
            
            
            
            let isSymmetric = array.isArraySymmetric()
            print("The array is" + (isSymmetric ? " " : " not ") + "symmetric.")
            
            
            
            _ = readLine()
            print("\n")
            
        }
        
    }
}


Program().main()


