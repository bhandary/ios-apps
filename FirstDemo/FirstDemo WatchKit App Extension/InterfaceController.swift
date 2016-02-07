//
//  InterfaceController.swift
//  FirstDemo WatchKit App Extension
//
//  Created by manbhand on 1/19/16.
//  Copyright © 2016 Manju Bhandary. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var myLabel: WKInterfaceLabel!
    

    @IBAction func changeLabel() {
        
        myLabel.setText("First Watch app!")
    }
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
