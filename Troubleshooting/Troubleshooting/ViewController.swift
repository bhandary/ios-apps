//
//  ViewController.swift
//  Troubleshooting
//
//  Created by manbhand on 2/6/16.
//  Copyright © 2016 Manju Bhandary. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    
    @IBAction func refreshTime(sender: AnyObject) {
        
        // get current date (includes time)
        let now = NSDate()
        
        // create date formatter, set to hours:minutes am/pm
        let formatter = NSDateFormatter()
        formatter.dateFormat = "HH:mm a"
        
        // change label
        timeLabel.text = formatter.stringFromDate(now)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

