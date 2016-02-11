//
//  PhotosTableViewController.swift
//  PhotoViewer
//
//  Created by Manju Bhandary on 2/8/16.
//  Copyright © 2016 Manju Bhandary. All rights reserved.
//

import UIKit

class PhotosTableViewController: UITableViewController {
    
    var photos = [Photo]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var newPhoto = Photo(name: "Emerald Bay", filename: "emeraldbay", notes: "Emerald Bay, one of Lake Tahoe's most popular and photogenic locations.")
        photos.append(newPhoto)
        
        newPhoto = Photo(name: "A Joshua Tree", filename: "joshuatree", notes: "A Joshua Tree in the Mojave Desert")
        photos.append(newPhoto)
        
        newPhoto = Photo(name: "Sunset in Ventura", filename: "sunset", notes: "Romantic sunset at the beach")
        photos.append(newPhoto)
        
        newPhoto = Photo(name: "Snowman at Lake Tahoe", filename: "snowman", notes: "Lake Tahoe gets 400 inches of snow every year.")
        photos.append(newPhoto)
        
        newPhoto = Photo(name: "Red Rock", filename: "redrock", notes: "Spectacular formations at Red Rock Canyon State Park")
        photos.append(newPhoto)


        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return photos.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("photoCell", forIndexPath: indexPath)

        // Configure the cell...
        let currentPhoto = photos[indexPath.row]
        cell.textLabel?.text = currentPhoto.name

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

        // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        let secondScene = segue.destinationViewController as! DisplayViewController
        // Pass the selected object to the new view controller.
        if let indexPath = self.tableView.indexPathForSelectedRow {
            let selectedPhoto = photos[indexPath.row]
            secondScene.currentPhoto = selectedPhoto
        }
        
    }
    

}
