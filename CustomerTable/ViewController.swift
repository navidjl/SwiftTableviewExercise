//
//  ViewController.swift
//  CustomerTable
//
//  Created by Navid Jalili on 2018-04-18.
//  Copyright © 2018 navidjalili. All rights reserved.
//

import UIKit
import Firebase
import MGSwipeTableCell

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var customerTableView: UITableView!
    
    var data: [Any] = []
    
    var ref: DatabaseReference!
    var maxID = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        initData()
    }
    
    func initUI() {
        let image = UIImage(named: "edit") as UIImage?
        editButton.setImage(image, for: .normal)
    }
    
    func initData() {
        ref = Database.database().reference()
        ref.child("users").observe(DataEventType.value, with: { (snapshot) in

            self.data = []
            let value = snapshot.value as? NSArray
            self.maxID = "\((value?.count)!)"
            if (value?.count)! > 0 {
                for i in 0...value!.count - 1 {
                    if value![i] is NSNull {
                        
                    } else {
                        let val = value![i] as? NSDictionary
                        if val != nil {
                            let item = [
                                "id": "\(i)",
                                "firstName": val!["firstName"],
                                "lastName": val!["lastName"],
                                "number": val!["number"],
                                "email": val!["email"]
                            ]
                            self.data.append(item)
                        }
                    }
                    
                }
                
            }
            
            self.customerTableView.reloadData()

        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    @IBAction func tappedAddButton(_ sender: Any) {
        let vc =  self.storyboard?.instantiateViewController(withIdentifier: "AddViewController") as! AddViewController
        vc.state = 0
        vc.id = maxID
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func tappeEditButton(_ sender: Any) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomerTableViewCell", for: indexPath as IndexPath) as! CustomerTableViewCell
        let customer = data[indexPath.row] as! [String: String]
        cell.nameLabel.text = "\(customer["firstName"]!) \(customer["lastName"]!)"
        cell.numberLabel.text = customer["number"]
        cell.emailLabel.text = customer["email"]
        let id = customer["id"]!
        cell.rightButtons = [MGSwipeButton(title: "Delete", backgroundColor: .red, callback: {(sender: MGSwipeTableCell!) -> Bool in
            self.ref = Database.database().reference()
            self.ref.child("users").child(id).removeValue()
            return true
        })]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc =  self.storyboard?.instantiateViewController(withIdentifier: "AddViewController") as! AddViewController
        let customer = data[indexPath.row] as! [String: String]
        vc.firstName = customer["firstName"]!
        vc.lastName = customer["lastName"]!
        vc.number = customer["number"]!
        vc.email = customer["email"]!
        vc.id = customer["id"]!
        vc.state = 1
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

