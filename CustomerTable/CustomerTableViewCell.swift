//
//  CustomerTableViewCell.swift
//  CustomerTable
//
//  Created by Navid Jalili on 2018-04-18.
//  Copyright © 2018 navidjalili. All rights reserved.
//

import UIKit
import MGSwipeTableCell
class CustomerTableViewCell: MGSwipeTableCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
