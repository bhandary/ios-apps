//
//  DisplayViewController.swift
//  PhotoViewer
//
//  Created by Manju Bhandary on 2/8/16.
//  Copyright © 2016 Manju Bhandary. All rights reserved.
//

import UIKit

class DisplayViewController: UIViewController {
    
    var currentPhoto : Photo?

    @IBOutlet weak var currentImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage(named:  currentPhoto!.filename)
        currentImage.image = image
        
        self.title = currentPhoto!.name

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let thirdScene = segue.destinationViewController as! InfoViewController
        thirdScene.currentPhoto = currentPhoto
    }

}
