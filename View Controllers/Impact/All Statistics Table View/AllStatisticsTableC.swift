//
//  AllStatisticsViewController.swift
//  Vridian
//
//  Created by Eleanor on 1/23/19.
//

import UIKit

class AllStatisticsTableController: UITableViewController {

    let sections = ["All numbers are approximate"]
    let name = ["CO2 emissions reduced (lbs)", "Energy saved (kwh)", "Fuel savings (gal)", "Green miles traveled", "    from public transportation", "    on foot", "Number of times composted", "Number of times recycled", "    cans", "    paper", "    plastic", "    glass", "    batteries/electronics", "    other", "Paper saved (lbs)", "Plastic saved (lbs)", "    from bottles", "    from bags", "Water saved (gal)"]
    
    let numbers = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(AllStatCell.self, forCellReuseIdentifier: "cell")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return numbers.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        self.tableView.register(AllStatCell.self, forCellReuseIdentifier: "cell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "cell")
        // Depending on the section, fill the textLabel with the relevant text
        cell.textLabel?.text = name[indexPath.row]
        cell.detailTextLabel?.text = numbers[indexPath.row]
        // Return the configured cell
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
