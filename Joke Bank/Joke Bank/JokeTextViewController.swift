//
//  JokeTextViewController.swift
//  Joke Bank
//
//  Created by manbhand on 1/18/16.
//  Copyright © 2016 Manju Bhandary. All rights reserved.
//

import UIKit

class JokeTextViewController: UIViewController {
    
    var joke : Joke?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.textView.text = self.joke?.text
    }

    @IBOutlet weak var textView: UITextView!
    
    
}
