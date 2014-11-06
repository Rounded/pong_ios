//
//  DataModel.swift
//  pong
//
//  Created by bw on 11/4/14.
//  Copyright (c) 2014 rounded. All rights reserved.
//

import Foundation
import AlecrimCoreData

public let db = DataModel()

public class DataModel: CoreDataModel {
    
    var users: CoreDataTable<User> { return CoreDataTable<User>(dataModel: self) }
    
    private convenience init() {
        self.init(modelName: nil)
    }
    
}