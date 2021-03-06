//
//  AppDelegate.swift
//  SwiftExercise
//
//  Created by Navid Jalili on 2018-04-14.
//  Copyright © 2018 navidjalili. All rights reserved.
//
import UIKit

class TableViewCell: UITableViewCell, UITextFieldDelegate {

    let label:UITextField
    
    var listItems:ListItem? {
        didSet {
            label.text = listItems!.text
        }
    }

    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {

        label = UITextField(frame: CGRect.null)
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 16)
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        label.delegate = self
        label.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        addSubview(label)
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let leftMarginForLabel: CGFloat = 15.0
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = CGRect(x: leftMarginForLabel, y: 0, width: bounds.size.width - leftMarginForLabel, height: bounds.size.height)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
