//
//  CategoryData.swift
//  Viridian
//
//  Created by Eleanor on 3/8/19.
//

import Foundation

extension Activity {
    
    static let allActivities = [Activity.a1, Activity.a2, Activity.a3, Activity.a4, Activity.a5, Activity.a6, Activity.a7, Activity.a8, Activity.a9, Activity.a10, Activity.a11, Activity.a12, Activity.a13, Activity.a14, Activity.a15, Activity.a16, Activity.a17, Activity.a18, Activity.a19, Activity.a20, Activity.a21, Activity.a22, Activity.a23, Activity.a24, Activity.a25, Activity.a16, Activity.a27, Activity.a28, Activity.a29]
    
    static let reducing = allActivities.filter({ $0.catID == 1}) /* [Activity.a1, Activity.a2, Activity.a6, Activity.a7, Activity.a11, Activity.a12, Activity.a13, Activity.a14, Activity.a23, Activity.a26, Activity.a27, Activity.a28, Activity.a29] */
    
    static let reusing = allActivities.filter({ $0.catID == 2}) //[Activity.a24, Activity.a25]
    
    static let recycling = allActivities.filter({ $0.catID == 3}) // [Activity.a15, Activity.a16, Activity.a17, Activity.a18, Activity.a19, Activity.a20, Activity.a21, Activity.a22]
    
    static let food = allActivities.filter({ $0.catID == 4}) // [Activity.a3, Activity.a4, Activity.a5, Activity.a8, Activity.a9, Activity.a10]
}
