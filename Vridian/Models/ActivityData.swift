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
    var pts: Int
    var kWh: Float?
    var mi: Float?
    var paper: Int?
    var plastic: Int?
    var water: Float?
    
    init(id: Int, catID: Int, name: String, pts: Int, kWh: Float?, mi: Float?, paper: Int?, plastic: Int?, water: Float?){
        self.id = id
        self.catID = catID
        self.name = name
        self.pts = pts
        self.kWh = kWh ?? 0.0
        self.mi = mi ?? 0.0
        self.paper = paper ?? 0
        self.plastic = plastic ?? 0
        self.water = water ?? 0.0
    }
}

class CurrentActivity {
    static var sharedInstance = CurrentActivity()
    var activity:Activity?
}
