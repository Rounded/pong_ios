//
//  User.swift
//  pong
//
//  Created by bw on 11/6/14.
//  Copyright (c) 2014 rounded. All rights reserved.
//

import Foundation
import CoreData

class User: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var id: NSNumber
    @NSManaged var is_owed: NSNumber
    @NSManaged var owes_me: NSNumber
    @NSManaged var games_lost: NSSet
    @NSManaged var games_won: NSSet

}
