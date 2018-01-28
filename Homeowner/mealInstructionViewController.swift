//
//  mealInstructionsViewController.swift
//  Homeowner
//
//  Created by Yayi Zhang on 4/26/17.
//  Copyright © 2017 Syracuse University. All rights reserved.
//

import UIKit
class mealInstructionViewController: UIViewController{
    @IBOutlet var label: UILabel!
    var item: Item!
    var ingres = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.lineBreakMode = NSLineBreakMode.ByWordWrapping
        label.numberOfLines = 0
        for ingre in item.instruction{
            ingres = ingres + ingre + "\n" + "\n"
        }
        label.text = ingres
    }
}
