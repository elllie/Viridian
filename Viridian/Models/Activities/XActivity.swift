//
//  ActivityA.swift
//  Vridian
//
//  Created by Eleanor on 2/23/19.
//

import Foundation
import UIKit

class XActivity: Activity {

    var multiAdd: Bool
    var howMany: String
    
    init(multiAdd: Bool, howMany: String, id: Int, catID: Int, name: String, image: UIImage, pts: Int, kWh: Float?, mi: Float?, paper: Int?, plastic: Int?, water: Float?) {
        
        self.multiAdd = multiAdd
        self.howMany = howMany
        
        super.init(id: id, catID: catID, name: name, image: image, pts: pts, kWh: kWh, mi: mi, paper: paper, plastic: plastic, water: water)
        
        
    }
}
