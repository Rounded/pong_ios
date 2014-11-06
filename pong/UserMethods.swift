//
//  UserMethods.swift
//  pong
//
//  Created by bw on 11/6/14.
//  Copyright (c) 2014 rounded. All rights reserved.
//

import Foundation

extension User {
    
    class func index( complete: () -> () ) {
        let manager = AFHTTPRequestOperationManager()

        manager.GET("http://rounded-pong.herokuapp.com/api/v1/users.json",
            parameters: nil,
            success: { (operation: AFHTTPRequestOperation!, users: AnyObject!) in
                var mapping: Dictionary<String, String> = ["id": "id", "name": "name"]
                for user : Dictionary<String, AnyObject> in (users as Array) {
                    db.users.save(user, primaryKey: "id", mapping: mapping)
                }
                db.save()
                complete();
            },
            failure: { (operation: AFHTTPRequestOperation!, error: NSError!) in
                println("Error: " + error.localizedDescription)
            }
        )
    }

    class func debts( complete: () -> () ) {
        let manager = AFHTTPRequestOperationManager()
        manager.GET(
            NSString(format: "http://rounded-pong.herokuapp.com/api/v1/users/%@/debts.json", 1),
            parameters: nil,
            success: { (operation: AFHTTPRequestOperation!, users: AnyObject!) in
                println(users);
                
                for user : AnyObject in (users as NSMutableArray) {
                }
                
                complete();
            },
            failure: { (operation: AFHTTPRequestOperation!,
                error: NSError!) in
                println("Error: " + error.localizedDescription)
            }
        )
    }

    class func settleDebt(boughtCoffeeFor : NSNumber, complete: () -> () ) {
        let manager = AFHTTPRequestOperationManager()
        manager.POST(
            NSString(format: "http://rounded-pong.herokuapp.com/api/v1/users/%@/debts.json", 1),
            parameters: ["bought_coffee_for": boughtCoffeeFor],
            success: { (operation: AFHTTPRequestOperation!, response: AnyObject!) in
                // just a 200
                complete();
            },
            failure: { (operation: AFHTTPRequestOperation!,
                error: NSError!) in
                println("Error: " + error.localizedDescription)
            }
        )
    }


}