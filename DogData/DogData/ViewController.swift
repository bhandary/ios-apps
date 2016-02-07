//
//  ViewController.swift
//  DogData
//
//  Created by manbhand on 1/21/16.
//  Copyright © 2016 Manju Bhandary. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var dogs: Results<Dog>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    override func viewWillAppear(animated: Bool) {
        updateUI()
    }
    
    func updateUI() {
        do {
            let realm = try Realm()
            self.dogs = realm.objects(Dog)
            
        } catch {}
        self.tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dogs!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let dog = self.dogs![indexPath.row]
        cell.textLabel!.text = "\(dog.name) is \(dog.age) years old!"
        return cell
        
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            let dog = self.dogs![indexPath.row]
            
            do {
                let realm = try Realm()
                try realm.write{
                    realm.delete(dog)
                }
                
            } catch {}
            
            updateUI()
        }
    }
}

