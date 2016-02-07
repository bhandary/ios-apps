//
//  ViewController.swift
//  Wishlist
//
//  Created by manbhand on 1/14/16.
//  Copyright © 2016 Manju Bhandary. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var products : [Product] = []
    
    var selectedProduct : Product? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        // makeSampleProduct()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        
        let request = NSFetchRequest(entityName: "Product")
        
        var results : [AnyObject]?
        
        do {
            results = try context.executeFetchRequest(request)
        } catch _ {
            results = nil
        }
        
        if results != nil {
            self.products = results! as! [Product]
        }
        self.tableView.reloadData()
    }
    
    func makeSampleProduct() {
        let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        
        let product = NSEntityDescription.insertNewObjectForEntityForName("Product", inManagedObjectContext: context) as! Product
        
        
        product.title = "Asics shoes"
        product.image = UIImageJPEGRepresentation(UIImage(named: "Nikes.jpeg")!, 1)
        
        do {
            try context.save()
        } catch _ {
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.products.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let product = self.products[indexPath.row]
        cell.textLabel!.text = product.title
        cell.imageView!.image = UIImage(data: product.image!)
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.selectedProduct = self.products[indexPath.row]
        self.performSegueWithIdentifier("tableViewToDetailSegue", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "tableViewToDetailSegue" {
            let detailVC = segue.destinationViewController as! ProductDetailViewController
            detailVC.product = self.selectedProduct
        }
    }
}

