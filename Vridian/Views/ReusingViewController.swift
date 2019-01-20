//
//  A1ViewController.swift
//  Roseling
//
//  Created by Eleanor on 1/17/19.
//

import UIKit

class A30ViewController: DetailViewControllerA {
// Cardboard or paper
    override func viewDidLoad() {
        super.viewDidLoad()
        activityID = 30
        multiAdd = true
        activityImage.image = #imageLiteral(resourceName: "paper-large")
        
        howManyLabel.text = "How many?"
        tipLabel.text = "Tip: Bulk retailers often have cardboard boxes available for free."

        // Do any additional setup after loading the view.
    }
}

class A31ViewController: DetailViewControllerA {
    // Cardboard or paper
    override func viewDidLoad() {
        super.viewDidLoad()
        activityID = 31
        multiAdd = true
        activityImage.image = #imageLiteral(resourceName: "plastic-bag")
        
        howManyLabel.text = "How many?"
        tipLabel.text = "Tip: Plastic grocery bags take longer to decompose than paper, but they are significantly sturdier and take much less energy to produce, making their overall impact smaller (especially if you reuse them)!"
        
        // Do any additional setup after loading the view.
    }
}
