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
    
    init() {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        moc = appDelegate?.persistentContainer.viewContext
    }
    
    
    // here he is... the real meat and potatoes of this app... drum roll please...
    func logActivity(id: Int, multi: Bool, amount: Int) {
        // parse the array output from ActivityController.prepareForLog
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        moc = appDelegate?.persistentContainer.viewContext
        
        var activityValues = [String: Any]()
        activityValues = ActivityController().prepareForLog(aid: Int64(id))
        print(activityValues)
        
        print("Activity ID:", id)
        print("Amount:", amount)
        
        // switch for singular items vs plural items
        // (multi-entry True makes many entries)
        // (multi-entry False makes one big entry)
        switch multi {
        case true:
            print("Multi-add")
            for i in Range(1...amount) {
                let entry = NSEntityDescription.insertNewObject(forEntityName: "Diary", into: moc) as! Diary
                //let entry = Diary(context: moc)
                
                entry.actID = activityValues["actID"] as! Int64
                entry.catID = activityValues["catID"] as! Int64
                entry.name = activityValues["name"] as! String
                entry.logged = NSDate() as Date
                entry.pts = activityValues["pts"] as! Int64
                entry.kWh = activityValues["kWh"] as! Double
                entry.mi = activityValues["mi"] as! Double
                entry.paper = activityValues["paper"] as! Int64
                entry.plastic = activityValues["plastic"] as! Int64
                entry.water = activityValues["water"] as! Double
                
                appDelegate?.saveContext()
            }
        default:
            print("Massive add")
            let entry = Diary(context: moc)
            
            entry.actID = activityValues["actID"] as! Int64
            entry.catID = activityValues["catID"] as! Int64
            entry.name = activityValues["name"] as! String
            entry.logged = NSDate() as Date
            entry.pts = activityValues["pts"] as! Int64 * Int64(amount)
            entry.kWh = (activityValues["kWh"] as! Double * Double(amount))
            entry.mi = (activityValues["mi"] as! Double * Double(amount))
            entry.paper = (activityValues["paper"] as! Int64 * Int64(amount))
            entry.plastic = (activityValues["plastic"] as! Int64 * Int64(amount))
            entry.water = (activityValues["water"] as! Double * Double(amount))
            
            appDelegate?.saveContext()
            
        }
    }
}
