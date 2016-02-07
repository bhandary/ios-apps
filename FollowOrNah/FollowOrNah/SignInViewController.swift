//
//  ViewController.swift
//  FollowOrNah
//
//  Created by manbhand on 2/5/16.
//  Copyright © 2016 Manju Bhandary. All rights reserved.
//

import UIKit
import Accounts
import Social

class SignInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func signInTapped(sender: AnyObject) {
        let account = ACAccountStore()
        let accountTypeTwitter = account.accountTypeWithAccountTypeIdentifier(ACAccountTypeIdentifierTwitter)
        
        account.requestAccessToAccountsWithType(accountTypeTwitter, options: nil) { (granted: Bool, error: NSError!) -> Void in
            if granted {
                let allAccounts = account.accountsWithAccountType(accountTypeTwitter)
                if allAccounts.count <= 0 {
                    print("no accounts")
                } else if allAccounts.count == 1 {
                    print("They only have one, let's use it")
                } else {
                    print("They have more than one...let's ask which one they want.")
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        self.performSegueWithIdentifier("chooseAccountSegue", sender: allAccounts)
                    })
                    
                }
                
            } else {
                print("it didn't work BRAH")
            }
            
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "chooseAccountSegue" {
            let selectVC = segue.destinationViewController as! SelectAccountViewController
            selectVC.accounts = sender as! [ACAccount]
            
            
        }
    }
    
    func moveToViewControllerWithAccount(account: ACAccount) {
        print("You made it!")
    }
}

