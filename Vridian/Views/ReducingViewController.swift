//
//  A1ViewController.swift
//  Roseling
//
//  Created by Eleanor on 1/17/19.
//

import UIKit

class A1ViewController: DetailViewControllerA {
// Air-dried laundry.
    override func viewDidLoad() {
        super.viewDidLoad()
        activityID = 1
        multiAdd = true
        activityImage.image = #imageLiteral(resourceName: "air-dried")
        
        howManyLabel.text = "How many loads?"
        tipLabel.text = "Tip: Air-drying also happens to be much gentler than a tumble dryer (even on low heat!) and makes your clothes last significantly longer."

        // Do any additional setup after loading the view.
    }
}

class A11ViewController: DetailViewControllerA {
    // Carried groceries in a reusable bag
    override func viewDidLoad() {
        super.viewDidLoad()
        activityID = 11
        multiAdd = true
        activityImage.image = #imageLiteral(resourceName: "reusable-bag")
        
        howManyLabel.text = "How many bags?"
        tipLabel.text = "Tip: The expensive insulated bags sold at the checkout counter are not your only option! Any old tote bag, basket, or backpack will carry your groceries just as well--and chances are you already own quite a few!"
        
        // Do any additional setup after loading the view.
    }
}

class A13ViewController: DetailViewControllerA {
    // Filled a reusable water bottle
    override func viewDidLoad() {
        super.viewDidLoad()
        activityID = 13
        multiAdd = false
        activityImage.image = #imageLiteral(resourceName: "reusable-bottle")
        
        howManyLabel.text = "Size of bottle (oz)"
        tipLabel.text = "Tip: Stainless steel and glass water bottles are sturdier and less prone to leaching than plastic ones, making them better for the environment and easier on your stomach!"
        
        // Do any additional setup after loading the view.
    }
}

class A14ViewController: DetailViewControllerA {
    // Hand-washed laundry
    override func viewDidLoad() {
        super.viewDidLoad()
        activityID = 14
        multiAdd = true
        activityImage.image = #imageLiteral(resourceName: "hand-washed")
        
        howManyLabel.text = "How many loads?"
        tipLabel.text = "Tip: Hand-washing is so good for your clothes that it is often touted as a replacement for professional dry cleaning."
        
        // Do any additional setup after loading the view.
    }
}

class A34ViewController: DetailViewControllerA {
    // Traveled on foot or other manual means
    override func viewDidLoad() {
        super.viewDidLoad()
        activityID = 34
        multiAdd = false
        activityImage.image = #imageLiteral(resourceName: "bicycle")
        
        howManyLabel.text = "Miles traveled"
        tipLabel.text = "Tip: Going places on foot is also a great way to stay healthy!"
        
        // Do any additional setup after loading the view.
    }
}

class A35ViewController: DetailViewControllerA {
    // Public transportation
    override func viewDidLoad() {
        super.viewDidLoad()
        activityID = 35
        multiAdd = false
        activityImage.image = #imageLiteral(resourceName: "public-transport")
        
        howManyLabel.text = "Miles traveled"
        tipLabel.text = "Tip: Take the time to find out what types of public transport your city offers--you may be surprised at what you didn't know you were paying for with your tax dollars!"
        
        // Do any additional setup after loading the view.
    }
}

class B27ViewController: DetailViewControllerB {
    // Replaced incandescent lightbulb
    override func viewDidLoad() {
        super.viewDidLoad()
        activityID = 27
        multiAdd = true
        activityImage.image = #imageLiteral(resourceName: "light-bulb")
        
        segmentedLabel.text = "Type of new bulbs"
        segmentedPicker.setTitle("CFL", forSegmentAt: 0)
        segmentedPicker.setTitle("LED", forSegmentAt: 1)
        
        howManyLabel.text = "How many were replaced?"
        tipLabel.text = "Tip: Though both are considerably better than incandescent lighting, LED bulbs last twice as long as CFL (fluorescent) and consume 30% less energy."
    }
}

class A33ViewController: DetailViewControllerA {
    // Switched to e-stataments/billing
    override func viewDidLoad() {
        super.viewDidLoad()
        activityID = 33
        multiAdd = true
        activityImage.image = #imageLiteral(resourceName: "e-statements")
        
        howManyLabel.text = "How many accounts?"
        tipLabel.text = "Tip: E-statements are also faster, more secure, and easier to use overall than paper bills. Some financial institutions also provide a discount for using the service. No excuses!"
        
        // Do any additional setup after loading the view.
    }
}
