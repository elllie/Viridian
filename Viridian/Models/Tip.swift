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
    
    static let tips = [Tip.t1, Tip.t2, Tip.t3, Tip.t4, Tip.t5, Tip.t6, Tip.t7, Tip.t8, Tip.t9, Tip.t10, Tip.t11]
    
    static func pick(activity: Activity) -> String {
        let a = activity.id
//        var newTips = Tip.tips
        var t = Tip.tips.randomElement()
        
        while !(t!.activities.contains(a)) {
            t = Tip.tips.randomElement()
//            newTips = newTips.filter( {$0.content != t!.content })
        }
        return (t?.content)!
    }
}
