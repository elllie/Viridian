//
//  Top10.swift
//  Vridian
//
//  Created by Eleanor on 3/2/19.
//

import Foundation
import UIKit
import CoreData

class Top10 {
    
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    var moc: NSManagedObjectContext!
    let persistentContainer = NSPersistentContainer(name: "Vridian")
    var entries: [Diary] = []
    
    var i: Int = 0
    
    func statsCount() -> [Int] {
        var counts: [Int] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28]
        collect()
      //  while (i <= 100) {
            for a in 0...28 {
                counts[a] = entries.filter( {$0.actID == (a + 1) }).reduce(0) {(result, entry) -> Int in
                    return result + 1
                }
           // i += counts[a]
            }
       // }
        return counts
    }
    
    func reduceStats() -> [Int] {
        let counts = statsCount()
        var top: [Int] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        
//        for b in 0...9 {
            for a in 0...28 {
//                if (counts[a] > top[b]) {
//                    top.shiftForward(idx: b)
//                    top[b] = (a + 1)
//                }
//            }
            if (counts[a] > top[0]) {
                top.shiftForward(idx: 0)
                top[0] = (a + 1)
            } else if (counts[a] > top[1]) {
                top.shiftForward(idx: 1)
                top[1] = (a + 1)
            } else if (counts[a] > top[2]) {
                top.shiftForward(idx: 2)
                top[2] = (a + 1)
            } else if (counts[a] > top[3]) {
                top.shiftForward(idx: 3)
                top[3] = (a + 1)
            } else if (counts[a] > top[4]) {
                top.shiftForward(idx: 4)
                top[4] = (a + 1)
            } else if (counts[a] > top[5]) {
                top.shiftForward(idx: 5)
                top[5] = (a + 1)
            } else if (counts[a] > top[6]) {
                top.shiftForward(idx: 6)
                top[6] = (a + 1)
            } else if (counts[a] > top[7]) {
                top.shiftForward(idx: 7)
                top[7] = (a + 1)
            } else if (counts[a] > top[8]) {
                top.shiftForward(idx: 8)
                top[8] = (a + 1)
            } else if (counts[a] > top[9]) {
                top.shiftForward(idx: 9)
                top[9] = (a + 1)
            }
        }
        return top
    }
}
