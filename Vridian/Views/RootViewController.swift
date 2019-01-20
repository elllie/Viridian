//
//  RootViewController.swift
//  Roseling
//
//  Created by Eleanor on 1/13/19.
//

import UIKit
import CoreData

class RootViewController: UITabBarController {
    
    var managedObjectContext: NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc1 = FirstViewController(nibName: "FirstViewController", bundle: nil)
        let vc2 = SecondViewController(nibName: "SecondViewController", bundle: nil)
        let etv = EntriesTableViewController(nibName: "EntriesTableViewController", bundle: nil)
        vc1.managedObjectContext = managedObjectContext
        vc2.managedObjectContext = managedObjectContext
        //etv.moc = managedObjectContext
        // Do any additional setup after loading the view.
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
