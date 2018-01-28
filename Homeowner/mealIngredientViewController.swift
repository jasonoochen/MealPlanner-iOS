//
//  mealIngredientsViewController.swift
//  Homeowner
//
//  Created by Yayi Zhang on 4/26/17.
//  Copyright © 2017 Syracuse University. All rights reserved.
//

import UIKit
class mealIngredientsViewController: UIViewController{
    @IBOutlet var foodLabel: UILabel!
    @IBOutlet var amountLabel: UILabel!
    
    var item: Item!
    var strfood = ""
    var stramount = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        foodLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        foodLabel.numberOfLines = 0
        amountLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        amountLabel.numberOfLines = 0
        for ingre in item.ingredient{
            stramount = stramount + "        " + ingre[0] + "\n" + "—————————————————————————" + "\n"
            strfood = strfood + ingre[1] + "\n" + "\n"
        }
        amountLabel.text = stramount
        amountLabel.textColor = UIColor.grayColor()
        foodLabel.text = strfood
    }
    
    
}
