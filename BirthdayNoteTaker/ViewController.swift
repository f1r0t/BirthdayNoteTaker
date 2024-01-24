//
//  ViewController.swift
//  BirthdayNoteTaker
//
//  Created by Fırat AKBULUT on 24.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldBirthday: UITextField!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelBirthday: UILabel!
    
    let storedName = UserDefaults.standard.object(forKey: "name")
    let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let newName = storedName as? String{
            labelName.text = "Name: \(newName)"
        }
        
        if let newBirthday = storedBirthday as? String{
            labelBirthday.text = "Birthday: \(newBirthday)" 
        }
        
    }
    
    @IBAction func buttonSave(_ sender: Any) {
        UserDefaults.standard.setValue(textFieldName.text!, forKey: "name")
        UserDefaults.standard.setValue(textFieldBirthday.text! , forKey: "birthday")
        
        labelName.text = "Name: \(textFieldName.text!)"
        labelBirthday.text = "Birthday: \(textFieldBirthday.text!)"
    }
    @IBAction func buttonDelete(_ sender: Any) {
        if storedName is String{
            UserDefaults.standard.removeObject(forKey: "name")
            labelName.text = "Name:"
        }
        if storedBirthday is String{
            UserDefaults.standard.removeObject(forKey: "birthday")
            labelBirthday.text = "Birthday:"
        }
    }
}

