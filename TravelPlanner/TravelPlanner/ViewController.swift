//
//  ViewController.swift
//  TravelPlanner
//
//  Created by manbhand on 2/1/16.
//  Copyright © 2016 Manju Bhandary. All rights reserved.
//

import UIKit
import Social
import Accounts

class ViewController: UIViewController, UIPickerViewDataSource,
UIPickerViewDelegate {
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var mySwitch: UISwitch!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var destinationLabel: UILabel!
    
    var destination: Destination = Destination()
    
    let vacationOptions : [String] = ["Beach", "Mountains"]
    var selectedOption : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.selectedOption = "Beach"
        self.destinationLabel.text = ""
        self.pickerView.dataSource = self
        self.pickerView.delegate = self
    }
    
    @IBAction func shareToFb(sender: AnyObject) {
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeFacebook) {
            let facebookSheet : SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            facebookSheet.setInitialText("Got my next vacay planned!")
            facebookSheet.addImage(self.imageView.image)
            self.presentViewController(facebookSheet, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Accounts Unavailable", message: "Please add Facebook account to share", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func whereTapped(sender: AnyObject) {
        if mySwitch.on {
            if self.selectedOption == "Beach" {
                self.destination.name = "Thailand"
                self.destination.image = UIImage(named: "Thailand.jpg")
            } else {
                self.destination.name = "Mt. Everest"
                self.destination.image = UIImage(named: "Everest.jpg")
            }
        } else {
            if self.selectedOption == "Beach" {
                self.destination.name = "Miami"
                self.destination.image = UIImage(named: "Miami.jpg")
            } else {
                self.destination.name = "Zion"
                self.destination.image = UIImage(named: "Zion.jpg")
            }
        }
        
        self.imageView.image = self.destination.image
        self.destinationLabel.text = "pack your bags to \(self.destination.name!)!"
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.vacationOptions.count
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.vacationOptions[row]
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.selectedOption = self.vacationOptions[row]
    }
}

