//
//  extensions.swift
//  DataStructures
//
//  Created by manbhand on 2/17/16.
//  Copyright © 2016 Manju Bhandary. All rights reserved.
//

import Foundation

extension Array {
    
    
    //returns the middle index
    func midIndex() -> Int {
        return Int(floor(Double(self.count / 2)))
    }
    
    
    //returns the first index
    func minIndex() ->Int {
        return 0
    }
    
    
    //returns the max index
    func maxIndex() ->Int {
        return self.count - 1
    }
    
}

