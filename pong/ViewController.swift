//
//  ViewController.swift
//  pong
//
//  Created by bw on 11/4/14.
//  Copyright (c) 2014 rounded. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let user = db.users.createEntity()
        user.name = "H Snep"
        
        db.save()

        for person in db.users {
            println(person.name)
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

