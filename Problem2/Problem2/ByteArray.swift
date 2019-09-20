//
//  ByteArray.swift
//  Problem2
//
//  Created by Andrew on 9/20/19.
//  Copyright © 2019 Andrew Allen. All rights reserved.
//

import Foundation

typealias Byte = UInt8

class ByteArray {
    
    static func getManuallyTypedArray(withCount n: Int) -> ByteArray {
        var array = [Byte]()
        
        for _ in 0..<n {
            let newVal = Byte(readLine()!)!
            array.append(newVal)
        }
        
        return ByteArray(withArray: array)
    }
    
    static func getRandomlyGeneratedArray(withCount n: Int) -> ByteArray {
        var array = [Byte]()
        
        for _ in 0..<n {
            let newVal = Byte.random(in: Byte.min...Byte.max)
            array.append(newVal)
        }
        
        return ByteArray(withArray: array)
    }
    
    
    
    
    let array: [Byte]
    
    init(withArray array: [Byte]) {
        self.array = array
    }
    
    
    
    
    func read() {
        for i in 0..<array.count {
            print(array[i], terminator: " ")
        }
    }
    
    func readBackward() {
        for i in 0..<array.count {
            let index = array.count - 1 - i
            print(array[index], terminator: " ")
        }
    }
    
    
    
    // Mark: - Additional methods
    
    func numberOfElementsWithDigitsLessThan(_ minDigitCount: Int) -> Int {
        
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
    
    
    
    func isArraySymmetric() -> Bool {
        let sideElements = (array.count / 2)
        for i in 0..<sideElements {
            if array[i] != array[array.count - 1 - i] {
                return false
            }
        }
        
        return true
    }
    

}
