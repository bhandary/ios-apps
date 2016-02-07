//
//  ProductDetailViewController.swift
//  Wishlist
//
//  Created by manbhand on 1/14/16.
//  Copyright © 2016 Manju Bhandary. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var storeLabel: UILabel!
   
    @IBOutlet weak var titleLabel: UILabel!
    
    var product : Product? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.titleLabel.text = self.product!.title
        self.storeLabel.text = self.product!.store
        self.imageView.image = UIImage(data: self.product!.image!)
    }
}
