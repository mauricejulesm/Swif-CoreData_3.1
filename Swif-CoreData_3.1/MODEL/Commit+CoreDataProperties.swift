//
//  Commit+CoreDataProperties.swift
//  Swif-CoreData_3.1
//
//  Created by Maurice on 10/3/19.
//  Copyright © 2019 maurice. All rights reserved.
//
//

import Foundation
import CoreData


extension Commit {

    @nonobjc public class func createFetchRequest() -> NSFetchRequest<Commit> {
        return NSFetchRequest<Commit>(entityName: "Commit")
    }

    @NSManaged public var date: NSDate
    @NSManaged public var message: String
    @NSManaged public var sha: String
    @NSManaged public var url: String
    @NSManaged public var author: Author

}
