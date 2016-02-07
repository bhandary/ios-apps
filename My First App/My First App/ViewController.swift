//
//  ViewController.swift
//  My First App
//
//  Created by manbhand on 9/8/15.
//  Copyright © 2015 manbhand. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func buttonTapped(sender: AnyObject) {
        self.view.backgroundColor = UIColor.redColor()
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

