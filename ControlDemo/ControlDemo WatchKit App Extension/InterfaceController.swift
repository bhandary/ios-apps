//
//  InterfaceController.swift
//  ControlDemo WatchKit App Extension
//
//  Created by Manju Bhandary on 2/16/16.
//  Copyright © 2016 Manju Bhandary. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBAction func valueChanged(value: Float) {
    }
    @IBAction func flippedSwitch(value: Bool) {
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
