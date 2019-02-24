//
//  SearchTableViewController.swift
//  Vridian
//
//  Created by Eleanor on 2/10/19.
//

import UIKit

class SearchTableViewController: UITableViewController {
    
    let activities = [Activity.a1, Activity.a2, Activity.a3, Activity.a4, Activity.a5, Activity.a6, Activity.a7, Activity.a8, Activity.a9, Activity.a10, Activity.a11, Activity.a12, Activity.a13, Activity.a14, Activity.a15, Activity.a16, Activity.a17, Activity.a18, Activity.a19, Activity.a20, Activity.a21, Activity.a22, Activity.a23, Activity.a24, Activity.a25, Activity.a26, Activity.a27, Activity.a28, Activity.a29]
    var filteredActivities = [Activity]()
    
    let searchController = UISearchController(searchResultsController: nil)
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Setup the Search Controller
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search for an activity..."
        searchController.searchBar.barTintColor = .white
        tableView.tableHeaderView = searchController.searchBar
        
//        let sBar: SearchBar = searchController.searchBar as! SearchBar
//        sBar.placeholder = "Search for an activity..."
//        sBar.showsCancelButton = true
//        sBar.cancelButtonColor = UIColor(named: "darkTint")
//        sBar.barTintColor = .white
//        tableView.tableHeaderView = sBar
        
        definesPresentationContext = true

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if isFiltering() {
            return filteredActivities.count
        }
        else {
            return activities.count
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let activity: Activity
        if isFiltering() {
            activity = filteredActivities[indexPath.row]
        } else {
            activity = activities[indexPath.row]
        }
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
            if isFiltering() {
                activity = filteredActivities[indexPath.row]
            } else {
                activity = activities[indexPath.row]
            }
        if (activities[indexPath.row] is XActivity) {
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
        print(activity.name)
    }
    
    // MARK: - Private instance methods
    
    func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredActivities = activities.filter({( activity : Activity) -> Bool in
            return activity.name.lowercased().contains(searchText.lowercased())
        })
        
        tableView.reloadData()
    }
    
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }

}

extension SearchTableViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)

    }
}
