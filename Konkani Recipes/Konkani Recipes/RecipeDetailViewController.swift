//
//  RecipeDetailViewController.swift
//  Konkani Recipes
//
//  Created by manbhand on 1/11/16.
//  Copyright © 2016 Manju Bhandary. All rights reserved.
//

import UIKit

class RecipeDetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var recipeLabel: UILabel!
    
    var name = "Jenna"
    var recipe = "Test Test"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameLabel.text = "\(self.name) Ingredients"
        
        self.recipeLabel.text = self.recipe
    }
}
