//
//  SearchResultsTableViewController.swift
//  Viridian
//
//  Created by Eleanor on 3/29/19.
//

import UIKit

class SearchResultsTableViewController: UITableViewController {
    
    var filteredActivities = SearchTableViewController().filteredActivities

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return filteredActivities.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        let activity: Activity
        activity = filteredActivities[indexPath.row]
        
        // Configure the cell...
        if activity.catID == 3 {
            if !(activity.name.hasPrefix("Recycled")) {
                activity.name = "Recycled " + activity.name.lowercased()
            }
        }
        cell.textLabel?.text = activity.name
        cell.textLabel?.font = UIFont(name: "Karla-Bold", size: 16)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let activity: Activity
        activity = filteredActivities[indexPath.row]
        
        if (activity is XActivity) {
            let detailView = TypeAViewController()
            
            Activity.CurrentActivity = activity
            
            detailView.titleLabelText = activity.name
            detailView.iconViewImage = activity.image
            detailView.howManyLabelText = (activity as! XActivity).howMany
            detailView.tipLabelText = Tip.pick(activity: Activity.CurrentActivity!)
            
            self.navigationController?.pushViewController(detailView, animated: true)
        }
        else {
            let detailView = TypeBViewController()
            
            Activity.CurrentActivity = activity
            
            detailView.titleLabelText = activity.name
            detailView.iconViewImage = activity.image
            detailView.tipLabelText = Tip.pick(activity: Activity.CurrentActivity!)
            
            self.navigationController?.pushViewController(detailView, animated: true)
        }
        Amplitude.instance()?.logEvent("Searched for activity", withEventProperties: ["Activity ID": Activity.CurrentActivity?.id ?? 0])
        print(activity.name)
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
