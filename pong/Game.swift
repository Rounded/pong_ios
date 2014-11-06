//
//  Game.swift
//  pong
//
//  Created by bw on 11/6/14.
//  Copyright (c) 2014 rounded. All rights reserved.
//

import Foundation
import CoreData

class Game: NSManagedObject {

    @NSManaged var created_at: NSDate
    @NSManaged var id: NSNumber
    @NSManaged var losing_team: NSSet
    @NSManaged var winning_team: NSSet

}
