//
//  ViewController.swift
//  FriendBookPlus
//
//  Created by manbhand on 1/12/16.
//  Copyright © 2016 Manju Bhandary. All rights reserved.
//

import UIKit

class FriendListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var friends = [Friend]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        createFriends()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    func createFriends() {
        
        let elaine = Friend()
        elaine.name = "Elaine"
        elaine.phoneNumber = "503-534-7723"
        elaine.birthday = "September 4th"
        elaine.picture = UIImage(named: "elaine")!
        self.friends.append(elaine)
        
        let george = Friend()
        george.name = "George"
        george.phoneNumber = "281-330-8004"
        george.birthday = "March 18th"
        george.picture = UIImage(named: "george")!
        self.friends.append(george)
        
        let krammer = Friend()
        krammer.name = "Krammer"
        krammer.phoneNumber = "1-800-456-8756"
        krammer.birthday = "December 1st"
        krammer.picture = UIImage(named: "krammer")!
        self.friends.append(krammer)
        
        let jerry = Friend()
        jerry.name = "Jerry"
        jerry.phoneNumber = "712-537-5633"
        jerry.birthday = "April 1st"
        jerry.picture = UIImage(named: "jerry")!
        self.friends.append(jerry)
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.friends.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let friend = self.friends[indexPath.row]
        cell.textLabel!.text = friend.name
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let friend = self.friends[indexPath.row]
        self.performSegueWithIdentifier("detailSegue", sender: friend)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let detailVC = segue.destinationViewController as! FriendDetailViewController
        detailVC.friend = sender as! Friend
        
    }
}

