//
//  GroceryCell.swift
//  Homeowner
//
//  Created by Yayi Zhang on 4/27/17.
//  Copyright © 2017 Syracuse University. All rights reserved.
//

import UIKit

class Grocery: UITableViewCell {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    
    func updateLabels() {
        let bodyFont = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        nameLabel.font = bodyFont
        
        //let captionFont = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        timeLabel.font = bodyFont
    }
}