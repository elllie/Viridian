//
//  Diary.swift
//  Roseling
//
//  Created by Eleanor on 1/12/19.
//

import Foundation
import CoreData

final class Activity: NSManagedObject {
    @NSManaged var actID: Int
    @NSManaged var catID: Int16
    @NSManaged var name: String
    @NSManaged var img: String
    @NSManaged var pts: Int64
    @NSManaged var kWh: Double
    @NSManaged var mi: Double
    @NSManaged var paper: Int16
    @NSManaged var plastic: Int16
    @NSManaged var water: Double
}

final class Diary: NSManagedObject {
    @NSManaged var actID: Int64
    @NSManaged var catID: Int64
    @NSManaged var name: String
    @NSManaged var logged: Date
    @NSManaged var pts: Int64
    @NSManaged var kWh: Double
    @NSManaged var mi: Double
    @NSManaged var paper: Int64
    @NSManaged var plastic: Int64
    @NSManaged var water: Double
}
