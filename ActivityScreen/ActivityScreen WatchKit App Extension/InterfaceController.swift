//
//  InterfaceController.swift
//  ActivityScreen WatchKit App Extension
//
//  Created by Manju Bhandary on 2/16/16.
//  Copyright © 2016 Manju Bhandary. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var messageLabel: WKInterfaceLabel!
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        var message = NSMutableAttributedString(string: "Stand. Move. Exercise. Try to complete the circles every day.")
        
        message.addAttribute(NSForegroundColorAttributeName, value: UIColor.cyanColor(), range: NSMakeRange(0, 6))
        message.addAttribute(NSForegroundColorAttributeName, value: UIColor.redColor(), range: NSMakeRange(7, 5))
        message.addAttribute(NSForegroundColorAttributeName, value: UIColor.greenColor(), range: NSMakeRange(13, 9))
        
        messageLabel.setAttributedText(message)
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
