//
//  ActivityData.swift
//  Vridian
//
//  Created by Eleanor on 1/28/19.
//

import Foundation

class Activity {
    var id: Int
    var catID: Int
    var name: String
    var multiAdd: Bool
    var pts: Int
    var kWh: Float?
    var mi: Float?
    var paper: Int?
    var plastic: Int?
    var water: Float?
    
    
    init(id: Int, catID: Int, name: String, multiAdd: Bool, pts: Int, kWh: Float?, mi: Float?, paper: Int?, plastic: Int?, water: Float?){
        self.id = id
        self.catID = catID
        self.name = name
        self.multiAdd = multiAdd
        self.pts = pts
        self.kWh = kWh ?? 0.0
        self.mi = mi ?? 0.0
        self.paper = paper ?? 0
        self.plastic = plastic ?? 0
        self.water = water ?? 0.0
    }
    
    static var CurrentActivity: Activity?
    
    static let a1 = Activity(id: 1, catID: 1, name: "Air-dried laundry", multiAdd: true, pts: 37479, kWh: 3.0, mi: nil, paper: nil, plastic: nil, water: nil)
}

//class CurrentActivity {
//    static var sharedInstance = CurrentActivity()
//    var activity: Activity?
//    //       CurrentActivity.sharedInstance.activity = Activity(id: 1, catID: 1, name: "Air-dried laundry", pts: 37479, kWh: 3.0, mi: nil, paper: nil, plastic: nil, water: nil)
//}
