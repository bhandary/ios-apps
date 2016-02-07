//
//  Task.swift
//  Night Porter Table View
//
//  Created by manbhand on 1/7/16.
//  Copyright © 2016 Manju Bhandary. All rights reserved.
//

import Foundation

enum TaskType {
    case Daily, Weekly, TwoWeeks, Monthly
}

struct Task {
    var name : String
    var type : TaskType
    var completed : Bool
    var lastCompleted : NSDate?
}
