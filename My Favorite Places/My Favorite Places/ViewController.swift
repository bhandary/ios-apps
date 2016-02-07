//
//  ViewController.swift
//  My Favorite Places
//
//  Created by manbhand on 1/25/16.
//  Copyright © 2016 Manju Bhandary. All rights reserved.
//

import UIKit
import CoreData
import MapKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var favorites: [Favorite] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        //createTestFavoritePlace()
    }
    
    override func viewWillAppear(animated: Bool) {
        let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext

        let request = NSFetchRequest(entityName: "Favorite")
        var results: [AnyObject]?
        
        do {
            try results = context.executeFetchRequest(request)
        } catch _ {
            results = nil
        }
        
        if results != nil {
            self.favorites = results as! [Favorite]
        }
        
        self.tableView.reloadData()
    }
    
    func createTestFavoritePlace() {
        let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        
        let favorite1 = NSEntityDescription.insertNewObjectForEntityForName("Favorite", inManagedObjectContext: context) as! Favorite
        
        favorite1.name = "Lake Tahoe"
        favorite1.latitude = 39.096849
        favorite1.longitude = 120.032351
        favorite1.latitudeDelta = 5
        favorite1.longitudeDelta = 5
        
        do {
            try context.save()
        } catch _ {
            
        }
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.favorites.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("mapCell") as! MapTableViewCell
        let favorite = self.favorites[indexPath.row]
        cell.favoriteNameLabel.text = favorite.name
        
        let coordinate = CLLocationCoordinate2DMake(favorite.latitude!.doubleValue, favorite.longitude!.doubleValue)
        
        let span = MKCoordinateSpanMake(favorite.latitudeDelta!.doubleValue, favorite.longitudeDelta!.doubleValue)
        
        let region = MKCoordinateRegionMake(coordinate, span)
        
        cell.favoriteMapView.setRegion(region, animated: false)
        
        return cell
    }


}

