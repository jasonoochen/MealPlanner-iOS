//
//  ItemsViewController.swift
//  Homeowner
//
//  Created by Yayi Zhang on 4/26/17.
//  Copyright © 2017 Syracuse University. All rights reserved.
//


import UIKit

var planStore = ItemStore()

class ItemsViewController: UITableViewController {
    var itemStore = ItemStore()
    var allItemStore = ItemStore()
    let refresh = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSThread.sleepForTimeInterval(2.0)
        navigationItem.title = "Meal"
        allItemStore.createItem()
        let size = allItemStore.getSize()
        var idx = arc4random_uniform(UInt32(size))
        var number = [Int]()
        for i in 0..<size{
            number.append(i)
        }
        for j in 0..<4{
            idx = arc4random_uniform(UInt32(size - j))
            itemStore.add(allItemStore.allItems[j])
            number.removeAtIndex(Int(idx))
        }
        
        refresh.addTarget(self, action: #selector(ItemsViewController.refresh(_:)), forControlEvents: UIControlEvents.ValueChanged)
        refresh.attributedTitle = NSAttributedString(string: "updating")
        self.refreshControl = refresh
        //tableView.addSubview(refresh)
    }
    
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    //IBAction for "fresh" button
    @IBAction func refresh(button: UIBarButtonItem) {
        itemStore.removeAllItem()
        let size = allItemStore.getSize()
        var idx = arc4random_uniform(UInt32(size))
        var number = [Int]()
        for i in 0..<size{
            number.append(i)
        }
        for j in 0..<4{
            idx = arc4random_uniform(UInt32(size - j))
            itemStore.add(allItemStore.allItems[number[Int(idx)]])
            number.removeAtIndex(Int(idx))
        }
        tableView.reloadData()
        refresh.endRefreshing()
    }

    //Tells the data source that a row at a specific location (sourceIndexPath) in the table view was moved to another location (destinationIndexPath). Model objects can be updated, if needed.
    //Implemenation of this function enables row reordering controls to appear in the tableView
    override func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        itemStore.moveItemFromIndex(sourceIndexPath.row, toIndex: destinationIndexPath.row)
    }
    
    //Asks the delegate to return a new index path to retarget a proposed move of a row.
    //This function can be used to control row move attempts by the user
    override func tableView(tableView: UITableView, targetIndexPathForMoveFromRowAtIndexPath sourceIndexPath: NSIndexPath, toProposedIndexPath proposedDestinationIndexPath: NSIndexPath) -> NSIndexPath {
        return proposedDestinationIndexPath
    }
    
    //Asks the data source to return the number of sections in the table view.
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    //Asks the data source to return the number of rows in a given section of a table view.
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemStore.allItems.count
    }
    
    //Asks the data source for a cell to insert in a particular location of the table view.
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let item = itemStore.allItems[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("ItemCell", forIndexPath: indexPath) as! ItemCell
        
        cell.nameLabel.text = item.name
        cell.timeLabel.text = item.time
        
        cell.backgroundView = UIImageView(image: UIImage(named: item.imageURL!))
        cell.updateLabels()
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowItem" {
            if let row = tableView.indexPathForSelectedRow?.row {
                let item = itemStore.allItems[row]
                
                let destinationController = segue.destinationViewController as! DetailViewController
                destinationController.item = item
            }
        }
    }
    
    
}
















