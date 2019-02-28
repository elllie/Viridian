//
//  LogController.swift
//  Roseling
//
//  Created by Eleanor on 1/15/19.
//

import Foundation
import CoreData
import UIKit

extension Activity {
    
// this is where i would put the moc..... if I had one!!!
//
//    init() {
//        let appDelegate = UIApplication.shared.delegate as? AppDelegate
//        moc = appDelegate?.persistentContainer.viewContext
//    }
    
    
    // here he is... the real meat and potatoes of this app... drum roll please...
    func logActivity(amount: Int) {
    
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        moc = appDelegate?.persistentContainer.viewContext
        
        let activity: Activity = Activity.CurrentActivity!

        print(activity.name)
        
        print("Activity ID:", activity.id)
        print("Amount:", amount)
        
        // switch for singular items vs plural items
        // (multi-entry True makes many entries whereas False makes one big entry)
            if (activity as! XActivity).multiAdd {
                print("Multi-add")
                for _ in Range(1...amount) {
                    let entry = NSEntityDescription.insertNewObject(forEntityName: "Diary", into: moc) as! Diary
                    
                    entry.actID = Int32(activity.id)
                    entry.catID = Int16(activity.catID)
                    entry.name = activity.name
                    entry.logged = NSDate() as Date
                    entry.pts = Int32(activity.pts)
                    entry.kWh = activity.kWh ?? 0
                    entry.mi = activity.mi ?? 0
                    entry.paper = Int32(activity.paper ?? 0)
                    entry.plastic = Int32(activity.plastic ?? 0)
                    entry.water = activity.water ?? 0
                    
//                    appDelegate?.saveContext()
//                    print("Saved")
                }
            }
            else {
                let entry = NSEntityDescription.insertNewObject(forEntityName: "Diary", into: moc) as! Diary
                
                entry.actID = Int32(activity.id)
                entry.catID = Int16(activity.catID)
                entry.name = activity.name
                entry.logged = NSDate() as Date
                entry.pts = Int32(activity.pts * amount)
                entry.kWh = Float((activity.kWh ?? 0) * Float(amount))
                entry.mi = Float((activity.mi ?? 0) * Float(amount))
                entry.paper = Int32((activity.paper ?? 0) * amount)
                entry.plastic = Int32((activity.plastic ?? 0) * amount)
                entry.water = Float((activity.water ?? 0) * Float(amount))
                
            }
        
        appDelegate?.saveContext()
        print("saved")
    }
}
