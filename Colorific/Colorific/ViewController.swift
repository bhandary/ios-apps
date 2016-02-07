//
//  ViewController.swift
//  Colorific
//
//  Created by manbhand on 1/12/16.
//  Copyright © 2016 Manju Bhandary. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var selectedColor : UIColor?
    
    let colors : [UIColor] = [UIColor.redColor(), UIColor.blueColor(),
        UIColor.greenColor(), UIColor.purpleColor(), UIColor(red: 255/255, green: 0/255, blue: 128/255, alpha: 1.0), UIColor.yellowColor()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(animated: Bool) {
        self.tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.colors.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = self.colors[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        self.selectedColor = self.colors[indexPath.row]
        
        self.performSegueWithIdentifier("toColorScreen", sender: self)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "toColorScreen" {
            
            segue.destinationViewController.view.backgroundColor = self.selectedColor
            
        }
    }
}

