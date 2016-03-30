//
//  Sorting.swift
//  DataStructures
//
//  Created by manbhand on 2/17/16.
//  Copyright © 2016 Manju Bhandary. All rights reserved.
//

import Foundation

public class Sorting {
    func linearSearch(numberlist: Array<Int>, key: Int) {
        
        
        //check all possible values
        for number in numberlist {
            if number == key {
                print("value at key: \(key) found..")
                break
            }
        }
        
    }
    
    
    
    
    
    
    func binarySearch(sequence: Array<Int>, key: Int) {
        
        
        //establish indices - extensions
        let min = sequence.minIndex()
        let max = sequence.maxIndex()
        let mid = sequence.midIndex()
        
        
        //check bounds
        if key > sequence[max] || key < sequence[min] {
            print("search value \(key) not found..")
            return
        }
        
        
        //evaluate chosen number..
        let n = sequence[mid]
        
        
        print(String(n) + "value attempted..")
        
        
        if n > key {
            let slice: Array<Int> = Array(sequence[min...mid - 1])
            self.binarySearch(slice, key: key)
        }
        
        
        if n < key {
            let slice: Array<Int> = Array(sequence[mid + 1...max])
            self.binarySearch(slice, key: key)
        }
            
            
        else {
            print("search value \(key) found..")
            return
        }
        
        
    }
    
    
    
    
    /*
    modified binary search algorithm.
    makes use of closure expression to pass state information
    */
    
    func binarySearch(sequence: Array<Int>, key: Int, results: Bool -> Void) {
        
        
        //establish indices - extensions
        let min = sequence.minIndex()
        let max = sequence.maxIndex()
        let mid = sequence.midIndex()
        
        
        //check bounds
        if key > sequence[max] || key < sequence[min] {
            print("search value \(key) not found..")
            results(false)
            return
        }
        
        
        //evaluate chosen number..
        let n = sequence[mid]
        
        
        print(String(n) + "value attempted..")
        
        
        if n > key {
            let slice: Array<Int> = Array(sequence[min...mid - 1])
            self.binarySearch(slice, key: key)
        }
        
        
        if n < key {
            let slice: Array<Int> = Array(sequence[mid + 1...max])
            self.binarySearch(slice, key: key)
        }
            
            
        else {
            print("search value \(key) found..")
            results(true)
            return
        }
        
        
    }
    
    //numberList = [8, 2, 10, 9, 7, 5]
    
    func insertionSort(numberList: Array<Int>) -> Array<Int> {
        
        
        //mutated copy
        var output = numberList
        
        
        for primaryIndex in 0..<output.count {
            
            let key = output[primaryIndex]
            
            
            for var secondaryIndex = primaryIndex; secondaryIndex > -1; secondaryIndex-- {
                
                print("comparing \(key) and \(numberList[secondaryIndex])")
                
                if key < output[secondaryIndex] {
                    
                    //move into correct position
                    output.removeAtIndex(secondaryIndex + 1)
                    output.insert(key, atIndex: secondaryIndex)
                }
            }
        }
        
        return output
    }
    
    
    func insertionSortG<T: Comparable>(sequence: [T]) -> [T] {
        
        
        //mutated copy
        var output = Array(sequence)
        
        
        for primaryIndex in 0..<output.count {
            
            let key = output[primaryIndex]
            
            
            for var secondaryIndex = primaryIndex; secondaryIndex > -1; secondaryIndex-- {
                
                print("comparing \(key) and \(sequence[secondaryIndex])")
                
                if key < output[secondaryIndex] {
                    
                    //move into correct position
                    output.removeAtIndex(secondaryIndex + 1)
                    output.insert(key, atIndex: secondaryIndex)
                    
                }
            }
        }
        
        
        return output
        
    }
    
    
    
    
    
}
