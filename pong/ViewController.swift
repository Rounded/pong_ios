//
//  ViewController.swift
//  pong
//
//  Created by bw on 11/4/14.
//  Copyright (c) 2014 rounded. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate {

    let tableView = UITableView()
    let fetchedResultsController: NSFetchedResultsController = NSFetchedResultsController()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Setup tableview
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height)
        self.view.addSubview(self.tableView)
        
        // API call to grab users
        User.index { () -> () in
            self.tableView.reloadData()
        }
    }

    // MARK: TableView Methods
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("userCell") as? UITableViewCell
        
        if !(cell != nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "userCell")
        }
        
        var user: User = db.users.toArray()[indexPath.row]
        cell!.textLabel.text = user.name

        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return db.users.count()
    }
    
}

