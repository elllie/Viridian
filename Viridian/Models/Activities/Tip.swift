//
//  Tips.swift
//  Vridian
//
//  Created by Eleanor on 2/23/19.
//

import Foundation

class Tip {
    var content: String
    var activities: [Int]
    
    init(content: String, activities: [Int]) {
        self.content = content
        self.activities = activities
    }
    
    static let tips = [Tip.t1, Tip.t2, Tip.t3, Tip.t4, Tip.t5, Tip.t6, Tip.t7, Tip.t8, Tip.t9, Tip.t10, Tip.t11, Tip.t12, Tip.t13, Tip.t14, Tip.t15, Tip.t16, Tip.t17, Tip.t18, Tip.t19, Tip.t20, Tip.t21, Tip.t22, Tip.t23, Tip.t24, Tip.t25, Tip.t26, Tip.t27, Tip.t28, Tip.t29, Tip.t30, Tip.t31, Tip.t32, Tip.t33, Tip.t34, Tip.t35]
    
    static func pick(activity: Activity) -> String {
        let a = activity.id
        var newTips = Tip.tips
        
        var t = Tip.tips.randomElement()
        
        while !(t!.activities.contains(a)) {
            t = Tip.tips.randomElement()
            newTips = newTips.filter( {$0.content != t!.content })
        }
        return (t?.content)!
    }
}
