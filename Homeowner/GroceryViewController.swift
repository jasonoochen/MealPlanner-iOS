//
//  GroceryViewController.swift
//  Homeowner
//
//  Created by Yayi Zhang on 4/27/17.
//  Copyright © 2017 Syracuse University. All rights reserved.
//

import UIKit

class GroceryViewController: UITableViewController{
    var planStore = ItemStore()
    var itemStore = [[String]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let tabBarController = self.tabBarController as? TabBarViewController
        planStore = tabBarController!.planStore
        navigationItem.title = "Grocery List"
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        itemStore = [["","Bring your list to Market:"]]
        for meal in planStore.allItems{
            for food in meal.ingredient{
                var save = [String]()
                save.append(food.first!)
                save.append(food.last!)
                itemStore.append(save)
            }
        }
        tableView.reloadData()
    }
    
    //Asks the delegate to return a new index path to retarget a proposed move of a row.
    //This function can be used to control row move attempts by the user
    override func tableView(tableView: UITableView, targetIndexPathForMoveFromRowAtIndexPath sourceIndexPath: NSIndexPath, toProposedIndexPath proposedDestinationIndexPath: NSIndexPath) -> NSIndexPath {
        return proposedDestinationIndexPath
    }
    
    //Asks the data source to return the number of sections in the table view.
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        print("\(#function) 1")
        return 1
    }
    
    //Asks the data source to return the number of rows in a given section of a table view.
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("numberOfRowsInSection \(section): \(itemStore.count)")
        return itemStore.count
    }
    
    //Asks the data source for a cell to insert in a particular location of the table view.
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let item = itemStore[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("ItemCell", forIndexPath: indexPath) as! ItemCell
        cell.nameLabel.text = item.last
        cell.timeLabel.text = item.first
        cell.updateLabels()
        
        return cell
    }

}