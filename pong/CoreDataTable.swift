//
//  CoreDataTable.swift
//  pong
//
//  Created by Heather Snepenger on 11/6/14.
//  Copyright (c) 2014 rounded. All rights reserved.
//

import Foundation
import AlecrimCoreData
import CoreData

extension CoreDataTable {
    
    // This method only works if your db is exactly the same as your API
    func save(dict: Dictionary<String, AnyObject>, primaryKey: String) -> NSManagedObject {
       
        var object : NSManagedObject!
        
        var value: String = dict[primaryKey] as String

        if let fetchedObject = self.filterBy(attribute: primaryKey, value: value).first() {
            object = fetchedObject
        } else {
            object = self.createEntity()
        }
        
        // update all the key / values for the object
        for (key, value) in dict {
            object.setValue(value, forKey: key)
        }
        
        return object!
    }
    
    func save(dict: Dictionary<String, AnyObject>, primaryKey: String, mapping: Dictionary<String, String>) -> NSManagedObject {
        
        var object : NSManagedObject!
        
        var pkValue: NSInteger = dict[primaryKey] as NSInteger
        
        if let fetchedObject = self.filterBy(attribute: primaryKey, value: pkValue).first() {
            object = fetchedObject
        } else {
            object = self.createEntity()
        }
        
        // update all the key / values for the object
        for (key, value) in dict {
            if let newKey = mapping[key] {
                object.setValue(value, forKey: newKey)
            }
        }
        
        return object!
    }
    
}
