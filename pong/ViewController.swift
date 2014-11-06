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

        User.index { () -> () in
            for person in db.users {
                println(person.name)
            }
            
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

