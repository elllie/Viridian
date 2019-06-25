//
//  ActivityData.swift
//  Vridian
//
//  Created by Eleanor on 1/28/19.
//

import Foundation
import UIKit
import CoreData

class Activity {
    var moc: NSManagedObjectContext!
    
    var id: Int
    var catID: Int
    var name: String
    var image: UIImage
    var pts: Int
    var kWh: Float?
    var mi: Float?
    var paper: Int?
    var plastic: Int?
    var water: Float?
//    var impact: String
    
    
    init(id: Int, catID: Int, name: String, image: UIImage, pts: Int, kWh: Float?, mi: Float?, paper: Int?, plastic: Int?, water: Float?){//}, impact: String){
        self.id = id
        self.catID = catID
        self.name = name
        self.image = image
//        self.impact = impact
        
        self.pts = pts
        self.kWh = kWh ?? 0.0
        self.mi = mi ?? 0.0
        self.paper = paper ?? 0
        self.plastic = plastic ?? 0
        self.water = water ?? 0.0
    }
    
    static var CurrentActivity: Activity?
    
}

//class CurrentActivity {
//    static var sharedInstance = CurrentActivity()
//    var activity: Activity?
//    //       CurrentActivity.sharedInstance.activity = Activity(id: 1, catID: 1, name: "Air-dried laundry", pts: 37479, kWh: 3.0, mi: nil, paper: nil, plastic: nil, water: nil)
//}
