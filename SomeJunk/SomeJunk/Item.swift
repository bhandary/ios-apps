//
//  Item.swift
//  SomeJunk
//
//  Created by Manju Bhandary on 3/22/16.
//  Copyright © 2016 Manju Bhandary. All rights reserved.
//

import Foundation
import CoreData


class Item: NSManagedObject {

    override func awakeFromInsert() {
        super.awakeFromInsert()
        
        self.created = NSDate()
    }

}
