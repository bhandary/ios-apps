//
//  AddDogViewController.swift
//  DogData
//
//  Created by manbhand on 1/25/16.
//  Copyright © 2016 Manju Bhandary. All rights reserved.
//

import UIKit
import RealmSwift

class AddDogViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBAction func saveTapped(sender: AnyObject) {
        
        let dogAge = self.picker.selectedRowInComponent(0)
        let dogName = self.nameTextField.text!
        
        let dog = Dog()
        dog.name = dogName
        dog.age = dogAge
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(dog)
            }
        } catch {}
        
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.picker.dataSource = self
        self.picker.delegate = self
    }

    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 101
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(row)"
    }
}
