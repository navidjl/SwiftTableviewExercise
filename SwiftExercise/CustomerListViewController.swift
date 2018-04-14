//
//  CustomerListViewController.swift
//  SwiftExercise
//
//  Created by Navid Jalili on 2018-04-14.
//  Copyright © 2018 navidjalili. All rights reserved.
//

import UIKit

class CustomerTableViewController: UITableViewController {
    
    var customers = [String]()
    var newCustomer: String = ""
    
    @IBAction func edit(segue:UIStoryboardSegue) {
        
    }
 
    @IBAction func done(segue:UIStoryboardSegue) {
        print("done")
        let customerDetailVC = segue.source as! CustomerDetailViewController
        newCustomer = customerDetailVC.name
        print(newCustomer)
        listItems.append(ListItem(text: newCustomer))
        tableView.reloadData()

    }
    var listItems = [ListItem]()

    override func viewDidLoad() {
        super.viewDidLoad()
        print("View didload");
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "carCell")

        listItems += [ListItem(text: "towel"), ListItem(text: "sheets"), ListItem(text: "soap"), ListItem(text: "shampoo"), ListItem(text: "brush"), ListItem(text: "bucket"), ListItem(text: "shower"), ListItem(text: "curtains"), ListItem(text: "door"), ListItem(text: "window")]

   
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return listItems.count
    }
    
    override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCellEditingStyle,
                            forRowAt indexPath: IndexPath){
        
        
        if editingStyle == UITableViewCellEditingStyle.delete {
            listItems.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
            }
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

        let cell = tableView.dequeueReusableCell(withIdentifier: "carCell", for: indexPath) as! TableViewCell
        
     
        
        let item = listItems[indexPath.row]
        cell.listItems = item

        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        return cell
    }
    
}

