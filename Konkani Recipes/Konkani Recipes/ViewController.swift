//
//  ViewController.swift
//  Konkani Recipes
//
//  Created by manbhand on 1/10/16.
//  Copyright © 2016 Manju Bhandary. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    let myRecipes = ["Tendle Talasani", "Batata Vaag", "Karathe Puddi Sagle", "Bhenda Sagle", "Avanasa Sasam", "Ghosale Alle Piyava Ghasi"]
    
    var selectedRecipe = "Tendle Talasani"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.myRecipes.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel!.text = myRecipes[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(<#T##indexPath: NSIndexPath##NSIndexPath#>, animated: true)
        self.selectedRecipe = myRecipes[indexPath.row]
        self.performSegueWithIdentifier("recipeListToRecipeDetailSegue", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let detailViewController = segue.destinationViewController as! RecipeDetailViewController
        detailViewController.name = self.selectedRecipe
 
        if self.selectedRecipe == "" {
            detailViewController.recipe = ""
        } else if self.selectedRecipe == "" {
            detailViewController.recipe = ""
        }
    }
}

