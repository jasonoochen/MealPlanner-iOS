//
//  Item.swift
//  Homeowner
//
//  Created by Yayi Zhang on 4/26/17.
//  Copyright © 2017 Syracuse University. All rights reserved.
//


import UIKit

class Item: NSObject, NSCoding {
    var name: String
    var time: String?
    var serving: String?
    var calories: String?
    var imageURL: String?
    var ingredient: [[String]]
    var instruction: [String]
    var type: String?
    //var favor: String?
    
    //designated intializer
    init(name: String, time: String?, serving: String?, calories: String?, imageURL: String?, ingredient: [[String]], instruction: [String], type: String?) {
        self.name = name
        self.time = time
        self.serving = serving
        self.calories = calories
        self.imageURL = imageURL
        self.ingredient = ingredient
        self.instruction = instruction
        self.type = type
        //self.favor = favor
        super.init()
    }
    
    //convenience initializer
    convenience init(random: Bool) {
        if random {
            let adjectives = ["Fluffy", "Shiny", "Rusty"]
            let nouns = ["Bear", "Spork", "Mac"]
            
            var idx = arc4random_uniform(UInt32(adjectives.count))
            let randomAdjective = adjectives[Int(idx)]
            
            idx = arc4random_uniform(UInt32(nouns.count))
            let randomNoun = nouns[Int(idx)]
            
            let randomName = randomAdjective + " " + randomNoun
            
            let images = ["wontonNoodle", "beefStirFry","fontinasandwich"]
            idx = arc4random_uniform(UInt32(images.count))
            let image = images[Int(idx)]
            let ingre1 = ["4", "eggs"]
            let ingre2 = ["1 clove", "garlic"]
            let ingre3 = ["1","cauliflower"]
            let ingre4 = ["2","shallots"]
            let ingre5 = ["7oz","white wine"]
            let ingre6 = ["1","fennel"]
            let ingre7 = ["3oz","soy souse"]
            let ingredients = [ingre1, ingre2, ingre3, ingre4, ingre5, ingre6, ingre7]
            let instructions = ["1    Wash and dry the fresh produce.", "2    Place the ground turkey in a medium bowl.", "3    Quarter the jalapeno pepper lengthwise; remove and discard the stem, seeds, and membranens. Finely dice the pepper and add to the turkey.", "4    Once the pan/skillet is hot, add coconut oil and swirl to coat the bottm.", "5     Add soy sauce, rice vinegar, sesame oil, and honey to the salad bowl; whisk the dressing.", "6    Add the garlic to the dressing.", "7    Finish the dressing & serve your dish."]
            self.init(name: randomName, time: "30-40 minutes", serving: "2 servings", calories: "500 calories", imageURL: image, ingredient: ingredients, instruction: instructions, type: "American")
        }
        else {
            self.init(name: "", time: "", serving: "", calories: "", imageURL: "", ingredient: [], instruction: [], type: "")
        }
    }
    
    //Unarchiving: init() creates an object initialized from data in the NSCoder instance that is passed in the argument
    func encodeWithCoder(aCoder: NSCoder) {
        print("encodeWithCoder: \(name)")
        aCoder.encodeObject(name, forKey: "name")
        aCoder.encodeObject(time, forKey: "time")
        aCoder.encodeObject(serving, forKey: "serving")
        aCoder.encodeObject(calories, forKey: "calories")
        aCoder.encodeObject(imageURL, forKey: "imageURL")
        aCoder.encodeObject(ingredient, forKey: "ingredient")
        aCoder.encodeObject(instruction, forKey: "instruction")
        aCoder.encodeObject(type, forKey: "type")
        //aCoder.encodeObject(favor, forKey: "favor")
    }
    
    //unarchiving
    required init(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObjectForKey("name") as! String
        time = aDecoder.decodeObjectForKey("time") as! String?
        serving = aDecoder.decodeObjectForKey("serving") as! String?
        calories = aDecoder.decodeObjectForKey("calories") as! String?
        imageURL = aDecoder.decodeObjectForKey("imageURL") as! String?
        ingredient = aDecoder.decodeObjectForKey("ingredient") as! [[String]]
        instruction = aDecoder.decodeObjectForKey("instruction") as! [String]
        type = aDecoder.decodeObjectForKey("type") as! String?
        //favor = aDecoder.decodeObjectForKey("favor") as! String?
    }
}






















