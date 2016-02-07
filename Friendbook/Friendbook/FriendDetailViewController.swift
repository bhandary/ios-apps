//
//  FriendDetailViewController.swift
//  Friendbook
//
//  Created by manbhand on 9/11/15.
//  Copyright © 2015 manbhand. All rights reserved.
//

import UIKit

class FriendDetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    
    var name = "Jenna"
    var birthday = "June 18th"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.nameLabel.text = "\(self.name)'s birthday is:"
        self.birthdayLabel.text = self.birthday
    }

}
