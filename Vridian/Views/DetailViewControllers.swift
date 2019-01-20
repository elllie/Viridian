//
//  DetailViewController.swift
//  Roseling
//
//  Created by Eleanor on 1/16/19.
//

import UIKit
import CoreData

class DetailViewControllerA: UIViewController {
    
    var managedObjectContext: NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let doneButton = UIBarButtonItem(image: nil, style: .plain, target: self, action: #selector(doneButtonTapped))
        doneButton.title = "Done"
        self.navigationItem.rightBarButtonItem = doneButton
        
        
        // Do any additional setup after loading the view.
    }
    
    var activityID: Int = 0
    var multiAdd: Bool = false
    
    @IBOutlet weak var activityImage: UIImageView!
    
    @IBOutlet weak var howManyLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var stepper: UIStepper!
    @IBAction func stepperChanged(_ sender: UIStepper) {
        numberLabel.text = Int(sender.value).description
    }
    
    @objc func doneButtonTapped(){
        if (activityID == 13) {
            // case for reusable bottle (each 16 oz is a bottle saved)
            // if you have a really small water bottle... that's your problem
            LogController().logActivity(id: activityID, multi: true, amount: Int((stepper!.value) / 16))
        } else {
            LogController().logActivity(id: activityID, multi: multiAdd, amount: Int(stepper!.value)) }
        navigationController?.popViewController(animated: true)
    }
    /*
     
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

class DetailViewControllerB: UIViewController {
    var managedObjectContext: NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let doneButton = UIBarButtonItem(image: nil, style: .plain, target: self, action: #selector(doneButtonTapped))
        doneButton.title = "Done"
        self.navigationItem.rightBarButtonItem = doneButton
        
        
        // Do any additional setup after loading the view.
    }
    
    var activityID: Int = 0
    var multiAdd: Bool = false
    
    @IBOutlet weak var activityImage: UIImageView!
    
    @IBOutlet weak var segmentedLabel: UILabel!
    @IBOutlet weak var segmentedPicker: UISegmentedControl!
    @IBAction func pickerChanged(_ sender: Any) {
        switch segmentedPicker.selectedSegmentIndex
        {
        case 0:
            return
        case 1:
            activityID = activityID + 1
        default:
            break
        }
    }
    
    @IBOutlet weak var howManyLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var stepper: UIStepper!
    @IBAction func stepperChanged(_ sender: UIStepper) {
        numberLabel.text = Int(sender.value).description
    }
    
    
    
    @objc func doneButtonTapped(){
        LogController().logActivity(id: activityID, multi: multiAdd, amount: Int(stepper!.value))
        navigationController?.popViewController(animated: true)
    }
}

