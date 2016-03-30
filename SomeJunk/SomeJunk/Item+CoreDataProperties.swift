//
//  Item+CoreDataProperties.swift
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

extension Item {

    @NSManaged var created: NSDate?
    @NSManaged var details: String?
    @NSManaged var price: NSNumber?
    @NSManaged var title: String?
    @NSManaged var store: Store?
    @NSManaged var image: Image?
    @NSManaged var itemType: ItemType?

}
