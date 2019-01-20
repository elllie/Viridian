//
//  FirstViewController.swift
//  Roseling
//
//  Created by Eleanor on 1/3/19.
//

import UIKit
import CoreData

class FirstViewController: UIViewController, UITableViewDataSource {
    
    let sections = ["All numbers are approximate"]
    let name = ["CO2 emissions reduced (lbs)", "Energy saved (kwh)", "Fuel savings (gal)", "Green miles traveled", "    from public transportation", "    on foot", "Number of times composted", "Number of times recycled", "    cans", "    paper", "    plastic", "    glass", "    batteries/electronics", "    other", "Paper saved (lbs)", "Plastic saved (lbs)", "    from bottles", "    from bags", "Water saved (gal)"]
    let numbers = [StatisticsController().co2, StatisticsController().energy, StatisticsController().fuel, StatisticsController().greenMiles, StatisticsController().busMiles, StatisticsController().walkingMiles, StatisticsController().compostct, StatisticsController().recyclect, StatisticsController().canct, StatisticsController().paperct, StatisticsController().plasticct, StatisticsController().glassct, StatisticsController().eWasteCt, StatisticsController().otherRecycling, StatisticsController().paperlbs, StatisticsController().plasticlbs, StatisticsController().plasticFromBottles, StatisticsController().plasticFromBags, StatisticsController().water]
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "allStatCell", for: indexPath)
        // Depending on the section, fill the textLabel with the relevant text
        cell.textLabel?.text = name[indexPath.row]
        cell.detailTextLabel?.text = numbers[indexPath.row]
        
        // Return the configured cell
        return cell
    }
    
    
    var managedObjectContext: NSManagedObjectContext!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
