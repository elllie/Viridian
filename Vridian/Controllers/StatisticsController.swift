//
//  StatisticsController.swift
//  Roseling
//
//  Created by Eleanor on 1/15/19.
//

import Foundation
import CoreData
import UIKit

final class StatisticsController {
    
    var moc: NSManagedObjectContext!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    // everything
    lazy var entries: [Diary] = {
        let moc = self.appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<Diary>(entityName: "Diary")
        let logs: [Diary]
        do {
            logs = try moc.fetch(fetchRequest)
        } catch {
            fatalError("Failed to fetch diary: \(error)")
        }
        return logs
    }()
    
    // just recycling category
    lazy var recycling: [Diary] = {
        let moc = self.appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<Diary>(entityName: "Diary")
        let id = "3"
        fetchRequest.predicate = NSPredicate(format: "catID == %@", id)
        let logs: [Diary]
        do {
            logs = try moc.fetch(fetchRequest)
        } catch {
            fatalError("Failed to fetch diary: \(error)")
        }
        return logs
    }()
    
    // just activity 11 - Carried groceries in reusable bag
    lazy var reusableBag: [Diary] = {
        let moc = self.appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<Diary>(entityName: "Diary")
        let id = "11"
        fetchRequest.predicate = NSPredicate(format: "actID == %@", id)
        let logs: [Diary]
        do {
            logs = try moc.fetch(fetchRequest)
        } catch {
            fatalError("Failed to fetch diary: \(error)")
        }
        return logs
    }()
    
    // just activity 12 - Composted
    lazy var compost: [Diary] = {
        let moc = self.appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<Diary>(entityName: "Diary")
        let id = "12"
        fetchRequest.predicate = NSPredicate(format: "actID == %@", id)
        let logs: [Diary]
        do {
            logs = try moc.fetch(fetchRequest)
        } catch {
            fatalError("Failed to fetch diary: \(error)")
        }
        return logs
    }()
    
    // just activity 13 - Filled reusable bottle
    lazy var bottles: [Diary] = {
        let moc = self.appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<Diary>(entityName: "Diary")
        let id = "13"
        fetchRequest.predicate = NSPredicate(format: "actID == %@", id)
        let logs: [Diary]
        do {
            logs = try moc.fetch(fetchRequest)
        } catch {
            fatalError("Failed to fetch diary: \(error)")
        }
        return logs
    }()
    
    // just activity 17 - Batteries
    lazy var batteries: [Diary] = {
        let moc = self.appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<Diary>(entityName: "Diary")
        let id = "17"
        fetchRequest.predicate = NSPredicate(format: "actID == %@", id)
        let logs: [Diary]
        do {
            logs = try moc.fetch(fetchRequest)
        } catch {
            fatalError("Failed to fetch diary: \(error)")
        }
        return logs
    }()
    
    // just activity 18 - Cans
    lazy var cans: [Diary] = {
        let moc = self.appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<Diary>(entityName: "Diary")
        let id = "18"
        fetchRequest.predicate = NSPredicate(format: "actID == %@", id)
        let logs: [Diary]
        do {
            logs = try moc.fetch(fetchRequest)
        } catch {
            fatalError("Failed to fetch diary: \(error)")
        }
        return logs
    }()
    
    // just activity 19 - e-waste
    lazy var eWaste: [Diary] = {
        let moc = self.appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<Diary>(entityName: "Diary")
        let id = "17"
        fetchRequest.predicate = NSPredicate(format: "actID == %@", id)
        let logs: [Diary]
        do {
            logs = try moc.fetch(fetchRequest)
        } catch {
            fatalError("Failed to fetch diary: \(error)")
        }
        return logs
    }()
    
    // just activity 20 -
    lazy var smallPapers: [Diary] = {
        let moc = self.appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<Diary>(entityName: "Diary")
        let id = "20"
        fetchRequest.predicate = NSPredicate(format: "actID == %@", id)
        let logs: [Diary]
        do {
            logs = try moc.fetch(fetchRequest)
        } catch {
            fatalError("Failed to fetch diary: \(error)")
        }
        return logs
    }()
    
    // just activity 21 -
    lazy var largePapers: [Diary] = {
        let moc = self.appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<Diary>(entityName: "Diary")
        let id = "21"
        fetchRequest.predicate = NSPredicate(format: "actID == %@", id)
        let logs: [Diary]
        do {
            logs = try moc.fetch(fetchRequest)
        } catch {
            fatalError("Failed to fetch diary: \(error)")
        }
        return logs
    }()
    
    // just 23 - glass
    lazy var glass: [Diary] = {
        let moc = self.appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<Diary>(entityName: "Diary")
        let id = "23"
        fetchRequest.predicate = NSPredicate(format: "actID == %@", id)
        let logs: [Diary]
        do {
            logs = try moc.fetch(fetchRequest)
        } catch {
            fatalError("Failed to fetch diary: \(error)")
        }
        return logs
    }()
    
    // activity 24 - recycled plastic bag
    lazy var recycledBag: [Diary] = {
        let moc = self.appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<Diary>(entityName: "Diary")
        let id = "24"
        fetchRequest.predicate = NSPredicate(format: "actID == %@", id)
        let logs: [Diary]
        do {
            logs = try moc.fetch(fetchRequest)
        } catch {
            fatalError("Failed to fetch diary: \(error)")
        }
        return logs
    }()
    
    // 25 - recycled small plastic container
    lazy var smallPlastic: [Diary] = {
        let moc = self.appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<Diary>(entityName: "Diary")
        let id = "25"
        fetchRequest.predicate = NSPredicate(format: "actID == %@", id)
        let logs: [Diary]
        do {
            logs = try moc.fetch(fetchRequest)
        } catch {
            fatalError("Failed to fetch diary: \(error)")
        }
        return logs
    }()
    
    // 26 - large plastic container
    lazy var largePlastic: [Diary] = {
        let moc = self.appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<Diary>(entityName: "Diary")
        let id = "26"
        fetchRequest.predicate = NSPredicate(format: "actID == %@", id)
        let logs: [Diary]
        do {
            logs = try moc.fetch(fetchRequest)
        } catch {
            fatalError("Failed to fetch diary: \(error)")
        }
        return logs
    }()
    
    // just activity 31 - Reused plastic bag
    lazy var reusedBag: [Diary] = {
        let moc = self.appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<Diary>(entityName: "Diary")
        let id = "31"
        fetchRequest.predicate = NSPredicate(format: "actID == %@", id)
        let logs: [Diary]
        do {
            logs = try moc.fetch(fetchRequest)
        } catch {
            fatalError("Failed to fetch diary: \(error)")
        }
        return logs
    }()
    
    // just activity 34 - Traveled on foot or bicycle
    lazy var walkLogs: [Diary] = {
        let moc = self.appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<Diary>(entityName: "Diary")
        let id = "34"
        fetchRequest.predicate = NSPredicate(format: "actID == %@", id)
        let logs: [Diary]
        do {
            logs = try moc.fetch(fetchRequest)
        } catch {
            fatalError("Failed to fetch diary: \(error)")
        }
        return logs
    }()
    
    // just activity 35 - Traveled via public transportation:
    lazy var busLogs: [Diary] = {
        let moc = self.appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<Diary>(entityName: "Diary")
        let id = "35"
        fetchRequest.predicate = NSPredicate(format: "actID == %@", id)
        let logs: [Diary]
        do {
            logs = try moc.fetch(fetchRequest)
        } catch {
            fatalError("Failed to fetch diary: \(error)")
        }
        return logs
    }()
    
    // MARK: Secondary Values
    lazy var co2: String = {
        var emissions: Int = 0
        for entry in entries {
            emissions = emissions + Int(entry.pts)
        }
        return String(Double(emissions) / 10000)
    }()
    
    lazy var energy: String = {
        var kwh: Double = 0
        for entry in entries {
            kwh = kwh + entry.kWh
        }
        return String(kwh)
    }()
    
    lazy var walkingMiles: String = {
        var mi: Double = 0
        for entry in walkLogs {
            mi = mi + entry.mi
        }
        return String(mi)
    }()
    
    lazy var busMiles: String = {
        var mi: Double = 0
        for entry in busLogs {
            mi = mi + entry.mi
        }
        return String(mi)
    }()
    
    lazy var greenMiles: String = {
        var mi: Double = 0
        mi = Double(walkingMiles)! + Double(busMiles)!
        return String(mi)
    }()
    
    lazy var fuel: String = {
        let gal: Double = (Double(walkingMiles)! / 21.4) + ((Double(busMiles)! / 2) / 21.4)
        return String(gal)
    }()
    
    lazy var compostct: String = String(compost.count)
    
    lazy var bottlect: String = String(bottles.count)
    
    lazy var recyclect: String = String(recycling.count)
    
    lazy var canct: String = String(cans.count)
    
    lazy var paperct: String = String(smallPapers.count + largePapers.count)
    
    lazy var plasticct: String = String(recycledBag.count + smallPlastic.count + largePlastic.count)
    
    lazy var glassct: String = String(glass.count)
    
    lazy var eWasteCt: String = String(batteries.count + eWaste.count)
    
    lazy var otherRecycling: String = {
        let normal: Int = cans.count + smallPapers.count + largePapers.count + recycledBag.count + smallPlastic.count + largePlastic.count + glass.count + batteries.count + eWaste.count
        return String(recycling.count - normal)
    }()
    
    lazy var paperlbs: String = {
        var paper: Int = 0
        for entry in entries {
            paper = paper + Int(entry.paper)
        }
        return String(Double(paper) / 100)
    }()
    
    lazy var plasticlbs: String = {
        var grams: Int64 = 0
        for entry in entries {
            grams = grams + entry.plastic
        }
        return String(Double(grams) / 454)
    }()
    
    lazy var plasticFromBottles: String = {
        var grams: Int = 0
        for bottle in bottles {
            grams = grams + Int(bottle.plastic)
        }
        return String(Double(grams) / 454)
    }()
    
    lazy var plasticFromBags: String = {
        var grams: Int = 0
        for bag in reusableBag {
            grams = grams + Int(bag.plastic)
        }
        for bag in recycledBag {
            grams = grams + Int(bag.plastic)
        }
        for bag in reusedBag {
            grams = grams + Int(bag.plastic)
        }
        return String(Double(grams) / 454)
    }()
    
    lazy var water: String = {
        var gal: Double = 0
        for entry in entries {
            gal = gal + entry.water
        }
        return String(gal)
    }()
    
    func displayAll() {
        // Displays all recorded statistics in a table view sorted arbitrarily.
    }
}
