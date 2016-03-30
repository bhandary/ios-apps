//
//  DataStructuresTests.swift
//  DataStructuresTests
//
//  Created by manbhand on 2/17/16.
//  Copyright © 2016 Manju Bhandary. All rights reserved.
//

import XCTest
@testable import DataStructures

class DataStructuresTests: XCTestCase {
    
    private var numberList: Array<Int>!
    private var textList: Array<String>!
    private var sortTest: Sorting!
    
    
    override func setUp() {
        super.setUp()
        
        numberList = [8, 2, 10, 9, 7, 5]
        textList = ["Dog", "Cat", "Dinasour", "Lion", "Cheetah", "Gazelle", "Elephant", "Aardvark"]
        sortTest = Sorting()
    }
    
    func testBinarySearch() {
        
        var searchList: Array<Int> = Array<Int>()
        
        
        //populate collection..
        for number in 0...500 {
            searchList.append(number)
        }
        
        //perform theoretical search
        sortTest.binarySearch(searchList, key: 235)
        
    }

    
    func testInsertionSort() {
        
        let resultList: Array<Int> = sortTest.insertionSort(numberList)
        let sequence = sortTest.insertionSortG(textList)
        
        
        //evaluate results
        XCTAssertTrue(self.IsSorted(resultList), "item sequence not in sorted order..")
        XCTAssertTrue(self.IsSorted(sequence), "item sequence not in sorted order..")
        
    }
    
    //generic method to determine sorted order
    func IsSorted<T: Comparable>(sequence: [T]) -> Bool {
        
        
        for var primaryIndex = 0; primaryIndex < sequence.count; primaryIndex++ {
            
            //test sequence
            if (primaryIndex > 0 && sequence[primaryIndex] < sequence[primaryIndex - 1]) {
                return false
            }
            
        }
        
        return true
        
    }

    
}
