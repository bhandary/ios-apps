//
//  ViewController.swift
//  Joke Bank
//
//  Created by manbhand on 1/18/16.
//  Copyright © 2016 Manju Bhandary. All rights reserved.
//

import UIKit
import CoreData
import StoreKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, SKProductsRequestDelegate, SKPaymentTransactionObserver {
    
    @IBOutlet weak var tableView: UITableView!
    
    var collections = [Collection]()
    
    var products = [SKProduct]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        let collectionRequest = NSFetchRequest(entityName: "Collection")
        do {
            self.collections = try context.executeFetchRequest(collectionRequest) as! [Collection]
            if self.collections.count <= 0 {
                fillJokeBank()
            }
        } catch {
            
        }

        grabCollections()
        prepareForPurchase()
        SKPaymentQueue.defaultQueue().addTransactionObserver(self)
    }
    
    func prepareForPurchase() {
        let productSet : Set<String> = ["com.bhandary.jokes.science", "com.bhandary.jokes.sports"]
        let request = SKProductsRequest(productIdentifiers: productSet)
        request.delegate = self
        request.start()
    }
    
    func productsRequest(request: SKProductsRequest, didReceiveResponse response: SKProductsResponse) {
        print("products: \(response.products.count)")
        print("invalid: \(response.invalidProductIdentifiers.count)")
        self.products = response.products
        self.tableView.reloadData()
    }
    
    func paymentQueue(queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions {
            switch transaction.transactionState {
            case .Purchased:
                print("Purchased")
                break
            case .Failed:
                print("Failed")
                giveRewardForProduct(transaction.payment.productIdentifier)
                SKPaymentQueue.defaultQueue().finishTransaction(transaction)
                break
            case .Restored:
                print("Restored")
                break
            case .Purchasing:
                print("Purchasing")
                break
            case .Deferred:
                print("Deferred")
                break
            }
        }
    }
    
    func giveRewardForProduct(productID: String) {
        for collection in self.collections {
            if productID == collection.inAppPurchaseID {
                collection.purchased = true
                self.tableView.reloadData()
            }
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.collections.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let collection = self.collections[indexPath.row]
        
        if ((collection.inAppPurchaseID?.isEmpty) == nil) {
            cell.textLabel!.text = collection.title
            
        } else {
            if collection.purchased!.boolValue {
                cell.textLabel!.text = collection.title
            } else {
                var currentProduct: SKProduct?
                for product in self.products {
                    if product.productIdentifier == collection.inAppPurchaseID {
                        currentProduct = product
                    }
                }
                if currentProduct != nil {
                    let formatter = NSNumberFormatter()
                    formatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
                    formatter.locale = currentProduct?.priceLocale
                    let priceString = formatter.stringFromNumber((currentProduct?.price)!)
                    
                    cell.textLabel!.text = "LOCKED * \(collection.title!) * \(priceString!)"
                } else {
                    cell.textLabel!.text = "LOCKED * \(collection.title!)"
                }
            }
        }
        
        return cell
    }
    
    func grabCollections() {
        let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        let collectionRequest = NSFetchRequest(entityName: "Collection")
        do {
            self.collections = try context.executeFetchRequest(collectionRequest) as! [Collection]
            self.tableView.reloadData()
        } catch {
            
        }
    }
    
    func fillJokeBank() {
        let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        
        let collectionDescription = NSEntityDescription.entityForName("Collection", inManagedObjectContext: context)
        
        let jokeDescription = NSEntityDescription.entityForName("Joke", inManagedObjectContext: context)
        
        // Collections
        let yoMomma = Collection(entity: collectionDescription!, insertIntoManagedObjectContext: context)
        yoMomma.title = "Yo Momma Jokes"
        yoMomma.purchased = true
        
        let animal = Collection(entity: collectionDescription!, insertIntoManagedObjectContext: context)
        animal.title = "Animal Jokes"
        animal.purchased = true
        
        let sports = Collection(entity: collectionDescription!, insertIntoManagedObjectContext: context)
        sports.title = "Sports Jokes"
        sports.inAppPurchaseID = "com.bhandary.jokes.sports"
        sports.purchased = false
        
        let science = Collection(entity: collectionDescription!, insertIntoManagedObjectContext: context)
        science.title = "Science Jokes"
        science.inAppPurchaseID = "com.bhandary.jokes.science"
        science.purchased = false
        
        let taxiJoke = Joke(entity: jokeDescription!, insertIntoManagedObjectContext: context)
        taxiJoke.title = "Taxi"
        taxiJoke.text = "Yo Momma so fat that when she wears a yellow dress people chase after her and yell \"TAXI!\""
        taxiJoke.collection = yoMomma
        
        let lameJoke = Joke(entity: jokeDescription!, insertIntoManagedObjectContext: context)
        lameJoke.title = "Lame"
        lameJoke.text = "This is a lame joke"
        lameJoke.collection = animal
        
        let sportsJoke = Joke(entity: jokeDescription!, insertIntoManagedObjectContext: context)
        sportsJoke.title = "Sports"
        sportsJoke.text = "This is a sports joke"
        sportsJoke.collection = sports
        
        let scienceJoke = Joke(entity: jokeDescription!, insertIntoManagedObjectContext: context)
        scienceJoke.title = "Science"
        scienceJoke.text = "This is a science joke"
        scienceJoke.collection = science
        
        do {
            try context.save()
        } catch {
            
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let collection = self.collections[indexPath.row]
        if collection.purchased!.boolValue {
            self.performSegueWithIdentifier("CollectionToJokeSegue", sender: collection)
        } else {
            var currentProduct: SKProduct?
            for product in self.products {
                if product.productIdentifier == collection.inAppPurchaseID {
                    currentProduct = product
                }
            }
            let payment = SKPayment(product: currentProduct!)
            SKPaymentQueue.defaultQueue().addPayment(payment)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let jokesVC = segue.destinationViewController as! JokesViewController
        jokesVC.collection = sender as? Collection
    }
}

