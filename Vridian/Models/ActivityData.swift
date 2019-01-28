//
//  ActivityData.swift
//  Vridian
//
//  Created by Eleanor on 1/28/19.
//

import Foundation

struct Activity {
    var id: Int
    var catID: Int
    var name: String
    var pts: Int
    var kWh: Float?
    var mi: Float?
    var paper: Int?
    var plastic: Int?
    var water: Float?
}

class Activities {
    let a1 = Activity(id: 1, catID: 1, name: "Air-dried laundry", pts: 37479, kWh: 3.0, mi: 0, paper: 0, plastic: 0, water: 0)
}
