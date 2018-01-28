//
//  MealPlanViewController.swift
//  Homeowner
//
//  Created by Yayi Zhang on 4/27/17.
//  Copyright © 2017 Syracuse University. All rights reserved.
//

import UIKit

class MealPlanViewController: UITableViewController{
    var itemStore=ItemStore()
    override func viewDidLoad() {
        super.viewDidLoad()
        let tabBarController = self.tabBarController as? TabBarViewController
        itemStore = tabBarController!.planStore
        
        navigationItem.title = "Meal Plan"
        navigationItem.leftBarButtonItem = editButtonItem()
        tableView.estimatedRowHeight = 65
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        print("planStore")
    }
    
    //IBAction for "share" button
    @IBAction func share(button: UIBarButtonItem) {
        let alertController = UIAlertController(title: "share recipe?", message: "choose app", preferredStyle: .ActionSheet)
        let facebook = UIAlertAction(title: "facebook", style: .Default, handler: nil)
        let twitter = UIAlertAction(title: "twitter", style: .Default, handler: nil)
        let cancel = UIAlertAction(title: "cancel", style: .Default, handler: nil)
        alertController.addAction(facebook)
        alertController.addAction(twitter)
        alertController.addAction(cancel)
        self.presentViewController(alertController, animated: true){}
        //self.present(alertController, animated: true, completion: nil)
    }
    
    
    //Asks the data source to commit the insertion or deletion of a specified row
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        print(#function)
        
        if editingStyle == .Delete {
            let item = itemStore.allItems[indexPath.row]
            
            let title = "Delete \(item.name)?"
            let message = "Are you sure?"
            
            //UIAlertController
            let ac = UIAlertController(title: title, message: message, preferredStyle: .ActionSheet)
            
            //Cancel Action
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
            ac.addAction(cancelAction)
            
            //Delete Action
            let deleteAction = UIAlertAction(title: "Delete", style: .Destructive, handler: {(delete) -> Void in
                self.itemStore.removeItem(item)
                //self.imageStore.removeImageForKey(item.itemKey)
                
                self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            })
            
            ac.addAction(deleteAction)
            
            presentViewController(ac, animated: true, completion: nil)
        }
    }
    
    //Tells the data source that a row at a specific location (sourceIndexPath) in the table view was moved to another location (destinationIndexPath). Model objects can be updated, if needed.
    //Implemenation of this function enables row reordering controls to appear in the tableView
    override func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        print("\(#function) From: \(sourceIndexPath.row) To: \(destinationIndexPath.row)")
        itemStore.moveItemFromIndex(sourceIndexPath.row, toIndex: destinationIndexPath.row)
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
        print("numberOfRowsInSection \(section): \(itemStore.allItems.count)")
        return itemStore.allItems.count
    }
    
    //Asks the data source for a cell to insert in a particular location of the table view.
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //print("cellForRowAtIndexPath: S: \(indexPath.section) R: \(indexPath.row)")
        
        let item = itemStore.allItems[indexPath.row]
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ItemCell", forIndexPath: indexPath) as! ItemCell
        
        cell.nameLabel.text = item.name
        cell.timeLabel.text = item.time
        
        //cell.backgroundColor = UIColor(patternImage: UIImage(named: "fiveleaves")!)
        cell.backgroundView = UIImageView(image: UIImage(named: item.imageURL!))
        //cell.backgroundView?.contentMode = .ScaleAspectFit
        cell.updateLabels()
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "show" {
            if let row = tableView.indexPathForSelectedRow?.row {
                let item = itemStore.allItems[row]
                
                let destinationController = segue.destinationViewController as! MealDetailViewController
                destinationController.item = item
            }
        }
    }
    
}