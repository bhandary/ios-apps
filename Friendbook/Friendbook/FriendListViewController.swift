//
//  FriendListViewController.swift
//  Friendbook
//
//  Created by manbhand on 9/10/15.
//  Copyright © 2015 manbhand. All rights reserved.
//

import UIKit

class FriendListViewController: UIViewController, UITableViewDataSource,
    UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    let myFriends = ["Hannah", "Jocelyn", "Jonathan", "Liam"]
    
    var selectedFriend = "Joe"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.myFriends.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        cell.textLabel!.text = myFriends[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
        self.selectedFriend = myFriends[indexPath.row]
        
        self.performSegueWithIdentifier("friendListToFriendDetailSegue", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let detailViewController = segue.destinationViewController as!
            FriendDetailViewController
        detailViewController.name = selectedFriend
        
        if self.selectedFriend == "Hannah" {
            detailViewController.birthday = "July 19th"
        } else if self.selectedFriend == "Jocelyn" {
            detailViewController.birthday = "December 3rd"
        }  else if self.selectedFriend == "Jonathan" {
            detailViewController.birthday = "October 18th"
        }  else if self.selectedFriend == "Liam" {
            detailViewController.birthday = "February 7th"
        }
    }
}
