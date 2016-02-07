//
//  ViewController.swift
//  The Night Porter
//
//  Created by manbhand on 1/4/16.
//  Copyright © 2016 Manju Bhandary. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func changeBackground(sender: AnyObject) {
        view.backgroundColor = UIColor.darkGrayColor()
        
        // get all subviews inside the top-level view
        let allSubviews = view.subviews
        
        for eachView in allSubviews {
            
            if eachView is UILabel {
                let myLabel = eachView as! UILabel
                myLabel.textColor = UIColor.lightGrayColor()
            }
        }
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

