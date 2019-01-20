//
//  A1ViewController.swift
//  Roseling
//
//  Created by Eleanor on 1/17/19.
//

import UIKit

class A18ViewController: DetailViewControllerA {
    // aluminum can
    override func viewDidLoad() {
        super.viewDidLoad()
        activityID = 18
        multiAdd = true
        activityImage.image = #imageLiteral(resourceName: "recycled-can")
        
        howManyLabel.text = "How many cans?"
        tipLabel.text = "Tip: "
    }
}

class B20ViewController: DetailViewControllerB {
    // Cardboard or paper
    override func viewDidLoad() {
        super.viewDidLoad()
        activityID = 20
        multiAdd = true
        activityImage.image = #imageLiteral(resourceName: "paper-large")
        
        segmentedLabel.text = "Size"
        segmentedPicker.setTitle("Sheets", forSegmentAt: 0)
        segmentedPicker.setTitle("Box", forSegmentAt: 1)
        
        howManyLabel.text = "How many?"
        tipLabel.text = "Tip: Use your best judgement when determining if a paper item is small (sheet-sized) or large (box-sized). If a cat can fit inside, it's probably large."
        
        // Do any additional setup after loading the view.
    }
}

class A23ViewController: DetailViewControllerA {
    // glass
    override func viewDidLoad() {
        super.viewDidLoad()
        activityID = 23
        multiAdd = true
        activityImage.image = #imageLiteral(resourceName: "recycled-glass")
        
        howManyLabel.text = "How many?"
        tipLabel.text = "Tip: It takes more resources to recycle glass than it does to produce it. Some municipalities claim to accept glass and then end up throwing it away. Check with your local waste collection department to see if you are wasting your time."
    }
}

class A24ViewController: DetailViewControllerA {
    // plastic bag
    override func viewDidLoad() {
        super.viewDidLoad()
        activityID = 24
        multiAdd = true
        activityImage.image = #imageLiteral(resourceName: "plastic-bag")
        
        howManyLabel.text = "How many?"
        tipLabel.text = "Tip: The plastic found in grocery bags (PET) requires a special procedure to recycle. Some collection sites throw these bags in the garbage. Make sure you are recycling your plastic at a reputable location."
    }
}

class B25ViewController: DetailViewControllerB {
// Plastic container
    override func viewDidLoad() {
        super.viewDidLoad()
        activityID = 25
        multiAdd = true
        activityImage.image = #imageLiteral(resourceName: "plastic-small")
        
        segmentedLabel.text = "Size"
        segmentedPicker.setTitle("<1L", forSegmentAt: 0)
        segmentedPicker.setTitle(">1L", forSegmentAt: 1)
        
        howManyLabel.text = "How many?"
        tipLabel.text = "Tip: "

        // Do any additional setup after loading the view.
    }
}

