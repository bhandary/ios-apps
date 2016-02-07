//
//  FriendDetailViewController.swift
//  FriendBookPlus
//
//  Created by manbhand on 1/12/16.
//  Copyright © 2016 Manju Bhandary. All rights reserved.
//

import UIKit

class FriendDetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var pictureImageView: UIImageView!
    
    var friend = Friend()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.nameLabel.text = self.friend.name
        self.phoneLabel.text = self.friend.phoneNumber
        self.birthdayLabel.text = self.friend.birthday
        self.pictureImageView.image = self.friend.picture
        self.pictureImageView.contentMode = UIViewContentMode.ScaleAspectFit
    }


}
