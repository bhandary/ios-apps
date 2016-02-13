//
//  DecideViewController.swift
//  FollowOrNah
//
//  Created by manbhand on 2/12/16.
//  Copyright © 2016 Manju Bhandary. All rights reserved.
//

import UIKit
import Accounts
import Social

class DecideViewController: UIViewController {
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var friendLabel: UILabel!
    var account : ACAccount?
    var twitterUsers = [TwitterUser]()
    
    @IBAction func unfollowTapped(sender: AnyObject) {
    }
    @IBAction func keepFollowingTapped(sender: AnyObject) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        getFollowingCount()
        getFriends()
    }
    
    func showTopUser() {
        let user = self.twitterUsers.first!
        self.usernameLabel.text = user.name
        
    }
    
    func getFollowingCount() {
        let verifyAccountURL = NSURL(string: "https://api.twitter.com/1.1/account/verify_credentials.json")
        let verifyAccountRequest = SLRequest(forServiceType: SLServiceTypeTwitter, requestMethod: SLRequestMethod.GET, URL: verifyAccountURL, parameters: nil)
        verifyAccountRequest.account = self.account!
        verifyAccountRequest.performRequestWithHandler { (data: NSData!, response: NSHTTPURLResponse!, error: NSError!) -> Void in
            if error == nil {
                print("Roll Tide!")
                do {
                    let responseJSONDictionary = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableLeaves) as! [String : AnyObject]
                    //print(responseJSONDictionary)
                    let friendCount = responseJSONDictionary["friends_count"] as! Int
                    print(friendCount)
                    
                    self.friendLabel.text = "You are following \(friendCount) accounts"
                } catch {
                    
                }
            } else {
                print("we got a problem")
                print(error)
            }
        }
    }
    
    
    func getFriends() {
        let verifyAccountURL = NSURL(string: "https://api.twitter.com/1.1/friends/ids.json")
        let verifyAccountRequest = SLRequest(forServiceType: SLServiceTypeTwitter, requestMethod: SLRequestMethod.GET, URL: verifyAccountURL, parameters: nil)
        verifyAccountRequest.account = self.account!
        verifyAccountRequest.performRequestWithHandler { (data: NSData!, response: NSHTTPURLResponse!, error: NSError!) -> Void in
            if error == nil {
                print("Roll Tide!")
                do {
                    let responseJSONDictionary = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableLeaves) as! [String : AnyObject]
                    //print(responseJSONDictionary)
                    
                    let theIds = responseJSONDictionary["ids"] as! [Int]
                    self.getHydratedUsers(theIds)
                    
                } catch {
                    
                }
            } else {
                print("we got a problem")
                print(error)
            }
        }
    }
    
    func getHydratedUsers(twitterIds: [Int]) {
        print("let's hydrate")
        
        var hundredIds = [String]()
        var count = 1
        for twitId in twitterIds {
            if count <= 100 {
                hundredIds.append("\(twitId)")
            } else {
                break
            }
            count += 1
        }
        
        let verifyAccountURL = NSURL(string: "https://api.twitter.com/1.1/users/lookup.json")
        let verifyAccountRequest = SLRequest(forServiceType: SLServiceTypeTwitter, requestMethod: SLRequestMethod.GET, URL: verifyAccountURL, parameters: ["user_id": hundredIds])
        verifyAccountRequest.account = self.account!
        verifyAccountRequest.performRequestWithHandler { (data: NSData!, response: NSHTTPURLResponse!, error: NSError!) -> Void in
            if error == nil {
                print("Roll Tide!")
                do {
                    let responseJSONArray = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableLeaves) as! [AnyObject]
                    
                    
                    for user in responseJSONArray {
                        let userDictionary = user as! [String : AnyObject]
                        let twitterUser = TwitterUser()
                        twitterUser.name = userDictionary["name"] as! String
                        twitterUser.imageUrl = userDictionary["profile_image_url"] as! String
                        self.twitterUsers.append(twitterUser)
                    }
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.showTopUser()
                    })
                } catch {
                    
                }
            } else {
                print("we got a problem")
                print(error)
            }
        }

    }
    
}
