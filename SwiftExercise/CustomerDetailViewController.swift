//
//  CustomerDetailViewController.swift
//  SwiftExercise
//
//  Created by Navid Jalili on 2018-04-14.
//  Copyright © 2018 navidjalili. All rights reserved.
//

import UIKit

class CustomerDetailViewController: UIViewController {

    @IBOutlet weak var customerName: UITextField!
    var name: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isTranslucent=false
        self.navigationController?.navigationBar.clipsToBounds = false
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        
        if !customerName.text!.isEmpty {
            name = customerName.text!
        }
    
    }
    
}
