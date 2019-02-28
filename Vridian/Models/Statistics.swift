//
//  Statistics.swift
//  Vridian
//
//  Created by Eleanor on 2/24/19.
//

import Foundation
import CoreData
import UIKit

class Statistics {
    
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    var moc: NSManagedObjectContext!
    let persistentContainer = NSPersistentContainer(name: "Vridian")
    var entries: [Diary] = []
    
    func calculateTable() -> [String] {
        
        retrieve()
        
        let emissions = entries.reduce(0) {(result, entry) -> Int32 in
            return result + entry.pts
        }
        
        let energy = entries.reduce(0.0) {(result, entry) -> Float in
            return result + entry.kWh
        }
        
        let fuel = entries.reduce(0.0) {(result, entry) -> Float in
            return result + (entry.mi / 24.7)
        }
        
        let miles = entries.reduce(0.0) {(result, entry) -> Float in
            return result + entry.mi
        }
        
        let publicTransport = entries.filter( {$0.actID == 29}).reduce(0.0) {(result, entry) -> Float in
            return result + entry.mi
        }
        
        let onFoot = entries.filter( {$0.actID == 28}).reduce(0.0) {(result, entry) -> Float in
            return result + entry.mi
        }
        
        let compost = entries.filter( {$0.actID == 12}).reduce(0) {(result, entry) -> Int in
            return result + 1
        }
        
        let totalRecycled = entries.filter( {$0.catID == 3}).reduce(0) {(result, entry) -> Int in
            return result + 1
        }
        
        let cansRecycled = entries.filter( {$0.actID == 16}).reduce(0) {(result, entry) -> Int in
            return result + 1
        }
        
        let paperRecycled = entries.filter( {$0.actID == 18}).reduce(0) {(result, entry) -> Int in
            return result + 1
        }
        
        let plasticRecycled = entries.filter( {($0.actID == 21) || ($0.actID == 22)} ).reduce(0) {(result, entry) -> Int in
            return result + 1
        }
        
        let glassRecycled = entries.filter( {($0.actID == 20)} ).reduce(0) {(result, entry) -> Int in
            return result + 1
        }
        
        let batteriesRecycled = entries.filter( {($0.actID == 15) || ($0.actID == 17)} ).reduce(0) {(result, entry) -> Int in
            return result + 1
        }
        
        let allOtherRecycling = entries.filter( {($0.catID == 3) && !(($0.actID == 16) || ($0.actID == 18) || ($0.actID == 21) || ($0.actID == 22) || ($0.actID == 20) || ($0.actID == 15) || ($0.actID == 17))}).reduce(0) {(result, entry) -> Int in
            return result + 1
        }
        
        let totalPaper = entries.reduce(0.0) {(result, entry) -> Float in
            return result + (Float(entry.paper) * 0.01)
        }
        
        let totalPlastic = entries.reduce(0) {(result, entry) -> Float in
            return result + (Float(entry.plastic) / 454)
        }
        
        let bottleLbs = entries.filter( {($0.actID == 13)}).reduce(0) {(result, entry) -> Float in
            return result + (Float(entry.plastic) / 454)
        }
        
        let bagLbs = entries.filter( {($0.actID == 11) || ($0.actID == 21) || ($0.actID == 25)}).reduce(0) {(result, entry) -> Float in
            return result + (Float(entry.plastic) / 454)
        }
        
        let water = entries.reduce(0) {(result, entry) -> Float in
            return result + entry.water
        }
        
        return [String(emissions), String(energy), String(fuel), String(miles), String(publicTransport), String(onFoot), String(compost), String(totalRecycled), String(cansRecycled), String(paperRecycled), String(plasticRecycled), String(glassRecycled), String(batteriesRecycled), String(allOtherRecycling), String(totalPaper), String(totalPlastic), String(bottleLbs), String(bagLbs), String(water)]
    }
    

}
