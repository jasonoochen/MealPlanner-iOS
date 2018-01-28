//
//  ItemStore.swift
//  Homeowner
//
//  Created by Yayi Zhang on 4/26/17.
//  Copyright © 2017 Syracuse University. All rights reserved.
//

import Foundation

class ItemStore {
    var allItems = [Item]()

    
    init() {
        /*
        for _ in 0..<5 {
            createRandonItem()
        }
 */
    }
    
    let itemArchiveURL: NSURL = {
        let documentsDirectories = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        let documentDirectory = documentsDirectories.first!
        return documentDirectory.URLByAppendingPathComponent("items.archive")
    }()
    
    func saveChanges() -> Bool {
        print("Saving allItems to: \(itemArchiveURL.path!)")
        return NSKeyedArchiver.archiveRootObject(allItems, toFile: itemArchiveURL.path!)
    }
    
    //removes a specified item from the array
    func removeItem(item: Item) {
        if let index = allItems.indexOf(item) {
            allItems.removeAtIndex(index)
        }
    }
    
    //reorders an item in the array from "fromIndex" to "toIndex"
    func moveItemFromIndex(fromIndex: Int, toIndex: Int) {
        if fromIndex == toIndex {
            return
        }
        
        let item = allItems[fromIndex]
        
        allItems.removeAtIndex(fromIndex)
        
        allItems.insert(item, atIndex: toIndex)
    }
    
    //function to print all items in the array
    func printAllItems() {
        for item in allItems {
            print("Name: \(item.name)")
        }
    }
    
    //add item into itemStore
    func add(item: Item) {
        allItems.append(item)
    }
    
    //find whether item exists in itemStore
    func find(item: Item) -> Bool{
        var flag = false
        for i in allItems{
            if(item.name == i.name){
                flag = true
            }
        }
        return flag
    }
    
    //remove all items in itemStore
    func removeAllItem() {
        allItems = [Item]()
    }
    
    //return size of itemStore
    func getSize() -> Int{
        var size = 0
        for _ in allItems {
            size = size + 1
        }
        return size
    }
    
    //add random value data to ItemStore
    func createRandonItem() -> Item {
        let item = Item(random: true)
        allItems.append(item)
        return item
    }
    
    //add data to ItemStore
    func createItem(){
        let ingre1 = ["2 Pounds", "Thinly Sliced Beef"]
        let ingre2 = ["1 Cup", "Jasmine Rice"]
        let ingre3 = ["4 Cloves","Garlic"]
        let ingre4 = ["4 Ounces","Sugar Snap Peas"]
        let ingre5 = ["4","Scallions"]
        let ingre6 = ["1/3 Cup","Roasted Peanuts"]
        let ingre7 = ["1/4 Cup","Teriyaki Sauce"]
        let ingredients = [ingre1, ingre2, ingre3, ingre4, ingre5, ingre6, ingre7]
        let instructions = ["1    Prepare the ingredients.", "2    Cook the rice.", "3    Make the garlic-lime peanuts.", "4    Cook the vegetables.", "5     Cook the beef.", "6    Finish & serve your dish."]
        let item = Item(name: "Beef Teriyaki Stir-Fry", time: "25-35 mins", serving: "4 servings", calories: "670 calories", imageURL: "beefStirFry", ingredient: ingredients, instruction: instructions, type: "Japanese")
        allItems.append(item)
        
        let ingre11 = ["2", "Ciabatta Rolls"]
        let ingre21 = ["1", "Farm Egg"]
        let ingre31 = ["2 Ounces","Arugula"]
        let ingre41 = ["1 Bunch","Baby Broccoli"]
        let ingre51 = ["3 Ounces","Fontina Cheese"]
        let ingre61 = ["1 Ounce","Castelvetrano Olives"]
        let ingre71 = ["1 Ounce","Sweet Piquante Peppers"]
        let ingre81 = ["1/4 Cup", "Roasted Pistachios"]
        let ingredients1 = [ingre11, ingre21, ingre31, ingre41, ingre51, ingre61, ingre71, ingre81]
        let instructions1 = ["1    Prepare the ingredients.", "2    Cook & peel the egg.", "3    Cook the baby broccoli.", "4    Assemble the paninis.", "5     Cook the paninis.", "6    Make the salad & plate your dish."]
        let item1 = Item(name: "Philly-Style Turkey Sandwiches", time: "35-45 mins", serving: "2 servings", calories: "770 calories", imageURL: "turkeysandwich", ingredient: ingredients1, instruction: instructions1, type: "American")
        allItems.append(item1)
        
        let ingre12 = ["10 Ounces", "Ground Beef"]
        let ingre22 = ["3/4 Pound", "Yukon Gold Potatoes"]
        let ingre32 = ["3 Tablespoons","Ketchup"]
        let ingre42 = ["3 Tablespoons","Golden Raisins"]
        let ingre52 = ["1 Chipotle","Pepper"]
        let ingre62 = ["1/3 Cup","Panko Breadcrumbs"]
        let ingre72 = ["2 Teaspoons","Meatloaf Spice Blend"]
        let ingredients2 = [ingre12, ingre22, ingre32, ingre42, ingre52, ingre62, ingre72]
        let instructions2 = ["1    Prepare the ingredients.", "2    Make the chipotle ketchup.", "3    Start the meatloaf.", "4    Form the meatloaf.", "5     Bake the meatloaf.", "6    Cook the potatoes & plate your dish."]
        let item2 = Item(name: "Chipotle-Glazed Meatloaf", time: "35-45 mins", serving: "2 servings", calories: "710 calories", imageURL: "meatloaf", ingredient: ingredients2, instruction: instructions2, type: "American BBQ")
        allItems.append(item2)
        
        let ingre13 = ["1&3/8 Pounds", "Cod Tails"]
        let ingre23 = ["12 Flour", "Tortillas"]
        let ingre33 = ["1","Avocado"]
        let ingre43 = ["1 Head","Butter Lettuce"]
        let ingre53 = ["1/2 Pound","Green Cabbage"]
        let ingre63 = ["1 Tablespoon","White Wine Vinegar"]
        let ingre73 = ["3 Teaspoons","Rosted Peanuts"]
        let ingredients3 = [ingre13, ingre23, ingre33, ingre43, ingre53, ingre63, ingre73]
        let instructions3 = ["1    Prepare the ingredients.", "2    Marinate the cucumber & cabbage.", "3    Make the dressing & mash the avocado.", "4    Cook the cod.", "5     Warm the tortillas.", "6    Make the salad & serve your dish."]
        let item3 = Item(name: "Spiced Cod Tacos", time: "15-25 mins", serving: "4 servings", calories: "580 calories", imageURL: "codTaco", ingredient: ingredients3, instruction: instructions3, type: "Mexico")
        allItems.append(item3)
        
        
        let ingre14 = ["2", "Scallions"]
        let ingre24 = ["1 Pound", "Broccoli"]
        let ingre34 = ["1/2 Bunch","Garlic Chives"]
        let ingre44 = ["1 inch","Piece Ginger"]
        let ingre54 = ["1/2 Tablespoon","Gochujang"]
        let ingre64 = ["2 Tablespoon","Soy Glaze"]
        let ingre74 = ["1 Teaspoons","Sesame Oil"]
        let ingredients4 = [ingre14, ingre24, ingre34, ingre44, ingre54, ingre64, ingre74]
        let instructions4 = ["1    Prepare the ingredients.", "2    Roast the broccoli", "3    Start the sauce.", "4    Finish the sauce.", "5    Cook the noodles.", "6    Finish & plate your dish."]
        let item4 = Item(name: "Kung Pao Broccoli", time: "15-25 mins", serving: "2 servings", calories: "750 calories", imageURL: "kungpao", ingredient: ingredients4, instruction: instructions4, type: "American")
        allItems.append(item4)
        
        
        let ingre15 = ["4", "Chicken Breasts"]
        let ingre25 = ["2", "Cage-Free Eggs"]
        let ingre35 = ["1/2 Cups","Panko Breadcrumbs"]
        let ingre45 = ["2","Stalks Celery"]
        let ingre55 = ["1/2 Pounds","Yukon Potatoes"]
        let ingre65 = ["2 Tablespoon","Capers"]
        let ingre75 = ["1 Teaspoons","Honey"]
        let ingredients5 = [ingre15, ingre25, ingre35, ingre45, ingre55, ingre65, ingre75]
        let instructions5 = ["1    Prepare the ingredients.", "2    Cook the potatoes", "3    Make the fig jam.", "4    Bread the chicken.", "5    Cook the chicken.", "6    Make the potato salad & serve your dish."]
        let item5 = Item(name: "Chicken Milanese", time: "25-35 mins", serving: "4 servings", calories: "640 calories", imageURL: "Milanese", ingredient: ingredients5, instruction: instructions5, type: "British")
        allItems.append(item5)
        
        
        let ingre16 = ["10 Ounces", "Chicken Drums"]
        let ingre26 = ["1/2 Cup", "Jasmine Rice"]
        let ingre36 = ["1/2 Pound","Bok Choy"]
        let ingre46 = ["2","Stalks Celery"]
        let ingre56 = ["1 tablespoon","Sesame Seeds"]
        let ingre66 = ["2 Tablespoon","Cornstarch"]
        let ingre76 = ["1 Teaspoons","Sesame Oil"]
        let ingredients6 = [ingre16, ingre26, ingre36, ingre46, ingre56, ingre66, ingre76]
        let instructions6 = ["1    Cook the rice.", "2    Prepare the ingredients", "3    Cook the bok choy.", "4    Coat & cook the chicken.", "5    Finish the chicken & bok choy.", "6    Plate your dish."]
        let item6 = Item(name: "Sesame Chicken", time: "25-35 mins", serving: "4 servings", calories: "640 calories", imageURL: "Sesame", ingredient: ingredients6, instruction: instructions6, type: "Chinese")
        allItems.append(item6)
        
        
        let ingre17 = ["1 Persian", "Cucumber"]
        let ingre27 = ["1/2 Cup", "Greek Yogurt"]
        let ingre37 = ["1 Bunch","Cliantro & Mint"]
        let ingre47 = ["2","Stalks Celery"]
        let ingre57 = ["1 tablespoon","Saag Paneer Spice"]
        let ingredients7 = [ingre17, ingre27, ingre37, ingre47, ingre57]
        let instructions7 = ["1    Cook the rice.", "2    Prepare the ingredients", "3    Cook & chop the spinach.", "4    Make the saag paneer.", "5    Toast & cut the naan.", "6    Make the cucumber-yogurt sauce & plate your dish."]
        let item7 = Item(name: "Saag Paneer", time: "25-35 mins", serving: "4 servings", calories: "640 calories", imageURL: "Saag", ingredient: ingredients7, instruction: instructions7, type: "Italian")
        allItems.append(item7)
        
        
        let ingre18 = ["1 Pound", "Pork"]
        let ingre28 = ["1 Pound", "Rice Cake"]
        let ingre38 = ["1 Cup","Bleak Bean Sauce"]
        let ingre48 = ["1/4 Cup","Crème Fraîche"]
        let ingre58 = ["1 tablespoon","kimchi"]
        let ingredients8 = [ingre18, ingre28, ingre38, ingre48, ingre58]
        let instructions8 = ["1    Prepare the ingredients.", "2    Cook the pork", "3    Add the aromatics.", "4    4 Add the bok choy & make the sauce.", "5    Cook & finish the rice cakes.", "6    Serve your dish."]
        let item8 = Item(name: "Pork & Korean Rice Cakes", time: "25-35 mins", serving: "4 servings", calories: "750 calories", imageURL: "Cakes", ingredient: ingredients8, instruction: instructions8, type: "Korean")
        allItems.append(item8)
        
        
        let ingre19 = ["1 Bunch", "Cilantro"]
        let ingre29 = ["1 Bunch", " Mint"]
        let ingre39 = ["10 Ounce","Shrimp"]
        let ingre49 = ["2 Ounce","Noodles"]
        let ingre59 = ["1 tablespoon","Mirin"]
        let ingre69 = ["1 tablespoon","Sriracha"]
        let ingre79 = ["1","Rice Paper Wrappers"]
        let ingredients9 = [ingre19, ingre29, ingre39, ingre49, ingre59, ingre69,ingre79]
        let instructions9 = ["1    Prepare the ingredients.", "2    Cook the Shrimp", "3    Cook the noodles.", "4     Make the spicy peanut dipping sauce.", "5    Assemble the summer rolls.", "6    Serve your dish."]
        let item9 = Item(name: "Shrimp Summer Rolls", time: "25-35 mins", serving: "2 servings", calories: "700 calories", imageURL: "Shrimp", ingredient: ingredients9, instruction: instructions9, type: "Asian")
        allItems.append(item9)
        
        
        let ingre110 = ["1 Bunch", "Parsley"]
        let ingre210 = ["1 Bunch", "Thyme"]
        let ingre310 = ["10 Ounce","Lamb"]
        let ingre410 = ["2 Ounce","Spinach"]
        let ingre510 = ["1 tablespoon","Parmesan Cheese"]
        let ingre610 = ["1 tablespoon","Yellow Onion"]
        let ingre710 = ["1","Merguez Spice Blend "]
        let ingredients10 = [ingre110, ingre210, ingre310, ingre410, ingre510, ingre610,ingre710]
        let instructions10 = ["1    Prepare the ingredients.", "2    Cook the Lamb", "3    Add the squash, barley & herbs.", "4     Finish the soup.", "5    Plate your dish."]
        let item10 = Item(name: "Lamb & Butternut Squash Soup", time: "25-35 mins", serving: "2 servings", calories: "600 calories", imageURL: "Lamb", ingredient: ingredients10, instruction: instructions10, type: "African")
        allItems.append(item10)
        
        
        let ingre111 = ["1 Bunch", "Udon"]
        let ingre211 = ["1 Bunch", "Asparagus"]
        let ingre311 = ["2 Ounce","Mushrooms"]
        let ingre411 = ["2 tablespoon","Togarashi Blend"]
        let ingre511 = ["1 tablespoon","Rice Vinegar"]
        let ingre611 = ["2 tablespoon","Cornstarch"]
        let ingredients11 = [ingre111, ingre211, ingre311, ingre411, ingre511, ingre611]
        let instructions11 = ["1    Prepare the ingredients.", "2    Brown the mushrooms", "3    Make the sauce.", "4    Add the vegetables.", "5    Add the noodles & sauce", "6    Plate your dish."]
        let item11 = Item(name: "Fresh Udon Noodle Stir-Fry", time: "15-25 mins", serving: "2 servings", calories: "700 calories", imageURL: "Udon", ingredient: ingredients11, instruction: instructions11, type: "African")
        allItems.append(item11)
        
        
        let ingre112 = ["1 Bunch", "Udon"]
        let ingre212 = ["1 Bunch", "Asparagus"]
        let ingre312 = ["10 Ounce","Ground Beef"]
        let ingre412 = ["2 tablespoon","Miso Paste"]
        let ingre512 = ["1 tablespoon","Hoisin Sauce"]
        let ingre612 = ["2 Ounce","Sweet Potato"]
        let ingredients12 = [ingre112, ingre212, ingre312, ingre412, ingre512, ingre612]
        let instructions12 = ["1    Prepare the ingredients.", "2    Roast the sweet potato wedges", "3    Form the burgers.", "4    Cook the burgers.", "5    Dress the bok choy", "6    Plate your dish."]
        let item12 = Item(name: "Hoisin & Shiitake Burgers", time: "24-35 mins", serving: "2 servings", calories: "890 calories", imageURL: "Burgers", ingredient: ingredients12, instruction: instructions12, type: "Chinese")
        allItems.append(item12)

    }

    
}