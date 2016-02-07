//
//  JokesViewController.swift
//  Joke Bank
//
//  Created by manbhand on 1/18/16.
//  Copyright © 2016 Manju Bhandary. All rights reserved.
//

import UIKit

class JokesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var collection : Collection?
    
    var jokes = [Joke]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.jokes = self.collection?.jokes?.allObjects as! [Joke]
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.jokes.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let joke = self.jokes[indexPath.row]
        cell.textLabel?.text = joke.title
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let joke = self.jokes[indexPath.row]
        self.performSegueWithIdentifier("JokeToTextSegue", sender: joke)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let jokeTextVC = segue.destinationViewController as! JokeTextViewController
        
        jokeTextVC.joke = sender as? Joke
    }

}
