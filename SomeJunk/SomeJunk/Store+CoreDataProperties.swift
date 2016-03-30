//
//  Store+CoreDataProperties.swift
//  SomeJunk
//
//  Created by Manju Bhandary on 3/22/16.
//  Copyright © 2016 Manju Bhandary. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Store {

    @NSManaged var name: String?
    @NSManaged var attribute: UNKNOWN_TYPE
    @NSManaged var items: NSSet?
    @NSManaged var image: NSManagedObject?

}
