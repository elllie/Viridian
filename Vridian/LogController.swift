//
//  LogController.swift
//  Roseling
//
//  Created by Eleanor on 1/15/19.
//

import Foundation
import CoreData
import UIKit

final class LogController {
    
    var moc: NSManagedObjectContext!
//
//    init() {
//        let appDelegate = UIApplication.shared.delegate as? AppDelegate
//        moc = appDelegate?.persistentContainer.viewContext
//    }
    
    
    // here he is... the real meat and potatoes of this app... drum roll please...
    func logActivity(activity: Activity, multi: Bool, amount: Int) {
        
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        moc = appDelegate?.persistentContainer.viewContext
        
        print(activity)
        
        print("Activity ID:", activity.id)
        print("Amount:", amount)
        
        // switch for singular items vs plural items
        // (multi-entry True makes many entries)
        // (multi-entry False makes one big entry)
        switch multi {
        case true:
            print("Multi-add")
            for _ in Range(1...amount) {
                let entry = NSEntityDescription.insertNewObject(forEntityName: "Diary", into: moc) as! Diary
                
                entry.actID = Int64(activity.id)
                entry.catID = Int64(activity.catID)
                entry.name = activity.name
                entry.logged = NSDate() as Date
                entry.pts = Int64(activity.pts)
                entry.kWh = activity.kWh ?? 0
                entry.mi = activity.mi ?? 0
                entry.paper = Int64(activity.paper ?? 0)
                entry.plastic = Int64(activity.plastic ?? 0)
                entry.water = activity.water ?? 0
                
                appDelegate?.saveContext()
            }
        default:
            print("Massive add")
            let entry = Diary(context: moc)

            entry.actID = Int64(activity.id)
            entry.catID = Int64(activity.catID)
            entry.name = activity.name
            entry.logged = NSDate() as Date
            entry.pts = Int64(activity.pts * amount)
            entry.kWh = Float(activity.kWh ?? 0 * Float(amount))
            entry.mi = Float(activity.mi ?? 0 * Float(amount))
            entry.paper = Int64(activity.paper ?? 0 * amount)
            entry.plastic = Int64(activity.plastic ?? 0 * amount)
            entry.water = Float(activity.water ?? 0 * Float(amount))

            appDelegate?.saveContext()
            
        }
    }
}
