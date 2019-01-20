//
//  SecondViewController.swift
//  Roseling
//
//  Created by Eleanor on 1/3/19.
//

import UIKit
import CoreData

extension UIButton {
    
    func alignImageAndTitleVertically(padding: CGFloat = 6.0) {
        let imageSize = self.imageView!.frame.size
        let titleSize = self.titleLabel!.frame.size
        let totalHeight = imageSize.height + titleSize.height + padding
        
        self.imageEdgeInsets = UIEdgeInsets(
            top: -(totalHeight - imageSize.height),
            left: 0,
            bottom: 0,
            right: -titleSize.width
        )
        
        self.titleEdgeInsets = UIEdgeInsets(
            top: 0,
            left: -imageSize.width,
            bottom: -(totalHeight - titleSize.height),
            right: 0
        )
    }
    
}

class SecondViewController: UIViewController {
    
    var managedObjectContext: NSManagedObjectContext!
    
    @IBAction func ReducingButton(_ sender: UIButton) {
    }
    @IBAction func ReusingButton(_ sender: UIButton) {
    }
    @IBAction func RecyclingButton(_ sender: UIButton) {
    }
    @IBAction func FoodButton(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}
// the alert view
let alert = UIAlertController(title: "", message: "📝✅", preferredStyle: .alert)

class CategoriesViewController: UIViewController {
    

    
    func logAndBeep(activityID: Int) {
        LogController().logActivity(id: activityID, multi: true, amount: 1)
        present(alert, animated: true, completion: nil)
        
        // change to desired number of seconds (in this case 5 seconds)
        let when = DispatchTime.now() + 1
        DispatchQueue.main.asyncAfter(deadline: when){
            // your code with delay
            alert.dismiss(animated: true, completion: nil)
        }
    }
    
    // begin single-add activities
    
    // reducing
    @IBAction func boughtRefurb6(_sender: UIButton) {
        logAndBeep(activityID: 6)
    }
    @IBAction func packagelessItem7(_ sender: UIButton) {
        logAndBeep(activityID: 7)
    }
    @IBAction func compost12(_ sender: UIButton) {
        logAndBeep(activityID: 12)
    }
    @IBAction func lobbied16(_ sender: UIButton) {
        logAndBeep(activityID: 16)
    }
    @IBAction func menstrual29(_ sender: UIButton) {
        logAndBeep(activityID: 29)
    }
    @IBAction func razor32(_ sender: UIButton) {
        logAndBeep(activityID: 32)
    }
    
    
    // reusing
    
    // recycling
    @IBAction func battery17(_ sender: UIButton) {
        logAndBeep(activityID: 17)
    }
    @IBAction func device19(_ sender: UIButton) {
        logAndBeep(activityID: 19)
    }
    @IBAction func fabric22(_ sender: UIButton) {
        logAndBeep(activityID: 22)
    }
    
    //food
    @IBAction func pescatarian2(_ sender: UIButton) {
        logAndBeep(activityID: 2)
    }
    @IBAction func vegan3(_ sender: UIButton) {
        logAndBeep(activityID: 3)
    }
    @IBAction func vegetarian4(_ sender: UIButton) {
        logAndBeep(activityID: 4)
    }
    @IBAction func leftovers5(_ sender: UIButton) {
        logAndBeep(activityID: 5)
    }
    @IBAction func localProduce8(_ sender: UIButton) {
        logAndBeep(activityID: 8)
    }
    @IBAction func homeBrew9(_ sender: UIButton) {
        logAndBeep(activityID: 9)
    }
    @IBAction func reusableMug10(_ sender: UIButton) {
        logAndBeep(activityID: 10)
    }
    @IBAction func harvested15(_ sender: UIButton) {
        logAndBeep(activityID: 15)
    }
}


