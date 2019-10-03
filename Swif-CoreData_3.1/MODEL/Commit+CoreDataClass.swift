//
//  Commit+CoreDataClass.swift
//  Swif-CoreData_3.1
//
//  Created by falcon on 10/1/19.
//  Copyright © 2019 maurice. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Commit)
public class Commit: NSManagedObject {
    override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
        print("Init called!")
    }
}

