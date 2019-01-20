//
//  ActivityController.swift
//  Roseling
//
//  Created by Eleanor on 1/15/19.
//

import Foundation
import SQLite

final class ActivityController {

    let db: Connection
    let activity: Table
    
    let actID = Expression<Int64>("actID")
    let catID = Expression<Int64>("catID")
    let name = Expression<String>("name")
    let img = Expression<String>("img")
    let pts = Expression<Int64>("pts")
    let kwh = Expression<Double?>("kWh")
    let mi = Expression<Double?>("mi")
    let paper = Expression<Int64?>("paper")
    let plastic = Expression<Int64?>("plastic")
    let water = Expression<Double?>("water")
    
    init(){
        let path = Bundle.main.path(forResource: "Activity", ofType: "sqlite")!
        db = try! Connection(path, readonly: true)
        
        activity = Table("Activity")
        
    }
    
//    func fetchAll() -> NSFetchRequest<NSFetchRequestResult> {
//        let request = NSFetchRequest<Activity>(entityName: "Activity")
//        return request as! NSFetchRequest<NSFetchRequestResult>
//    }
//
//    func fetchCategory(catID: Int) -> NSFetchRequest<NSFetchRequestResult> {
//        let request = NSFetchRequest<Activity>(entityName: "Activity")
//        request.predicate = NSPredicate(format: "catID == %@", catID)
//        return request as! NSFetchRequest<NSFetchRequestResult>
//    }
    
    func callView(id: Int) {
        // Takes the actID of a selected collection view item and loads the corresponding detail view controller.
    }
    
    func prepareForLog(aid: Int64) -> [String: Any] {
        // fetches the row of data corresponding to a particular activity (via its actID)
        // and packages it into a dictionary that the logger can easily read.
        var activityValues = [String: Any]()
        for row in try! db.prepare(activity.filter(actID == aid)) {
//          no idea why but this only works inside a loop
            activityValues["actID"] = Int64(row[actID])
            activityValues["catID"] = Int64(row[catID])
            activityValues["name"] = String(row[name])
            activityValues["pts"] = Int64(row[pts])
            activityValues["kWh"] = Double(row[kwh] ?? 0.0)
            activityValues["mi"] = Double(row[mi] ?? 0.0)
            activityValues["paper"] = Int64(row[paper] ?? 0)
            activityValues["plastic"] = Int64(row[plastic] ?? 0)
            activityValues["water"] = Double(row[water] ?? 0.0)
        }
        //print(activityValues)
        return activityValues
    }
}
