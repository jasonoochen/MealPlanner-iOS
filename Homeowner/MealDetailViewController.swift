//
//  mealDetailViewController.swift
//  Homeowner
//
//  Created by Yayi Zhang on 4/26/17.
//  Copyright © 2017 Syracuse University. All rights reserved.
//

import UIKit

class MealDetailViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var servingLabel: UILabel!
    @IBOutlet var caloriesLabel: UILabel!
    @IBOutlet var ingredientLabel: UILabel!
    @IBOutlet var instructionLabel: UILabel!
    @IBOutlet var TypeLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var stackView: UIStackView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    
    var item: Item!

    @IBAction func indexChanged(send: UISegmentedControl){
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            firstView.hidden = false
            secondView.hidden = true
        case 1:
            firstView.hidden = true
            secondView.hidden = false
        default:
            break
        }
    }
    
    //IBAction for "Save" button
    @IBAction func SaveItem(button: UIBarButtonItem) {
        var alert: UIAlertController
        //var alert1: UIAlertView
        if(planStore.find(item)==false){
            planStore.add(item)
            alert = UIAlertController.init(title: "", message: "Yum! This recipe has been added to your meal plan", preferredStyle: .Alert)
            let OKAction = UIAlertAction(title: "OK", style: .Default){(ACTION) in }
            alert.addAction(OKAction)
            self.presentViewController(alert, animated: true){}
        }
        else{
            alert = UIAlertController.init(title: "", message: "Oops! This recipe has already existed in your meal plan", preferredStyle: .Alert)
            let OKAction = UIAlertAction(title: "OK", style: .Default){(ACTION) in }
            alert.addAction(OKAction)
            self.presentViewController(alert, animated: true){}
           
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let screenh = UIScreen.mainScreen().bounds.size.height
        let screenw = UIScreen.mainScreen().bounds.size.width
        scrollView.contentSize = CGSize(width: screenw, height: 1000)
        firstView.hidden = false
        secondView.hidden = true
        
        let tbc = self.tabBarController as! TabBarViewController
        planStore = tbc.planStore
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        print("DetailViewController viewWillAppear.")
        nameLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        nameLabel.numberOfLines = 0
        nameLabel.text = item.name
        nameLabel.font = UIFont.boldSystemFontOfSize(25)
        timeLabel.text = item.time! + " | " + item.serving!
        caloriesLabel.text = item.calories
        TypeLabel.text = item.type
        let imageURL = item.imageURL! + "1"
        imageView.image = UIImage(named: imageURL)
        navigationItem.title = item.name
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("DetailViewController viewWillDisappear.")
        
        item.name = nameLabel.text ?? ""
        
    }
    
    @IBAction func backgroundTapped(gestureRecognizer: UITapGestureRecognizer) {
        //print(#function)
        
        view.endEditing(true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ingre" {
            let destinationController = segue.destinationViewController as! mealIngredientsViewController
            destinationController.item = item!
        }
        if segue.identifier == "instruc" {
            let desController = segue.destinationViewController as! mealInstructionViewController
            desController.item = item!
        }
    }
   }

























