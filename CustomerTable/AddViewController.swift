//
//  AddViewController.swift
//  CustomerTable
//
//  Created by Navid Jalili on 2018-04-18.
//  Copyright © 2018 navidjalili. All rights reserved.
//

import UIKit
import Firebase
class AddViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var firstNameText: UITextField!
    @IBOutlet weak var lastNameText: UITextField!
    @IBOutlet weak var numberText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    var firstName = ""
    var lastName = ""
    var number = ""
    var email = ""
    
    var state = 0 ///0: add, 1: change
    var ref: DatabaseReference!
    var id = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        
    }
    
    func initUI() {
        if state == 0 {
            titleLabel.text = "Add Data"
        }
        else {
            titleLabel.text = "Change Data"
            firstNameText.text = firstName
            lastNameText.text = lastName
            numberText.text = number
            emailText.text = email
        }
    }
    
    @IBAction func tappedBackButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tappedRegisterButton(_ sender: Any) {
        if firstNameText.text?.count == 0 {
            showAlert(title: "Error", msg: "Please enter first name")
            return
        }
        
        if lastNameText.text?.count == 0 {
            showAlert(title: "Error", msg: "Please enter last name")
            return
        }
        
        if numberText.text?.count == 0 {
            showAlert(title: "Error", msg: "Please enter phone number")
            return
        }
        
        if emailText.text?.count == 0 {
            showAlert(title: "Error", msg: "Please enter email")
            return
        } else if !isValidEmail(testStr: emailText.text!) {
            showAlert(title: "Error", msg: "Please enter valid email")
            return
        }
        
        ref = Database.database().reference()
        let data = [
            "firstName": firstNameText.text,
            "lastName": lastNameText.text,
            "number": numberText.text,
            "email": emailText.text,
        ]
        
        var uuid = getUUID()
        if (id != "") {
            uuid = id
        }
        
        ref.child("users").child(uuid).setValue(data)
        
        navigationController?.popViewController(animated: false)
    }
    
    func showAlert(title: String, msg: String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    func getUUID() -> String {
        let uuid = UUID().uuidString
        return (uuid)
    }
}
