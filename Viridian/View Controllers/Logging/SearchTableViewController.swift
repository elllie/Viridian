//
//  SearchTableViewController.swift
//  Vridian
//
//  Created by Eleanor on 2/10/19.
//

import UIKit

class SearchTableViewController: UITableViewController {
    
    // MARK: - Types
    
    /// State restoration values.
    private enum RestorationKeys: String {
        case viewControllerTitle
        case searchControllerIsActive
        case searchBarText
        case searchBarIsFirstResponder
    }
    
    private struct SearchControllerRestorableState {
        var wasActive = false
        var wasFirstResponder = false
    }
    
    let activities = Activity.allActivities
    var filteredActivities = [Activity]()
    
    /** The following 2 properties are set in viewDidLoad(),
     They are implicitly unwrapped optionals because they are used in many other places
     throughout this view controller.
     */
    
    /// Search controller to help us with filtering.
    private var searchController: UISearchController!
    
    /// Secondary search results table view.
    private var resultsTableController: SearchResultsTableViewController!
    
    /// Restoration state for UISearchController
    private var restoredState = SearchControllerRestorableState()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "search"

        resultsTableController = SearchResultsTableViewController()
        
        resultsTableController.tableView.delegate = self
        
        searchController = UISearchController(searchResultsController: resultsTableController)
        searchController.searchResultsUpdater = self
        // Setup the Search Controller
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search for an activity..."
        searchController.searchBar.barTintColor = .white
        
        tableView.tableHeaderView = searchController.searchBar
        searchController.searchBar.barTintColor = .green

//        searchController.delegate = self
        searchController.dimsBackgroundDuringPresentation = false // The default is true.
        searchController.searchBar.delegate = self
        
        definesPresentationContext = true

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Restore the searchController's active state.
        if restoredState.wasActive {
            searchController.isActive = restoredState.wasActive
            restoredState.wasActive = false
            
            if restoredState.wasFirstResponder {
                searchController.searchBar.becomeFirstResponder()
                restoredState.wasFirstResponder = false
            }
        }
    }
    
    // MARK: Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let activity: Activity
        
        // Check to see which table view cell was selected.
        if tableView === self.tableView {
            activity = activities[indexPath.row]
        } else {
            activity = resultsTableController.filteredActivities[indexPath.row]
        }
        
        // Set up the detail view controller to show.
        
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
        
        tableView.deselectRow(at: indexPath, animated: false)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return activities.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let activity = activities[indexPath.row]
        
        // Set up the detail view controller to show.
        if activity.catID == 3 {
            if !(activity.name.hasPrefix("Recycled")) {
                activity.name = "Recycled " + activity.name.lowercased()
            }
        }
        cell.textLabel?.text = activity.name
        cell.textLabel?.font = UIFont(name: "Karla-Bold", size: 16)

        return cell
    }
    
    
    
    // MARK: - Private instance methods
    
//    func searchBarIsEmpty() -> Bool {
//        // Returns true if the text is empty or nil
//        return searchController.searchBar.text?.isEmpty ?? true
//    }
//
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredActivities = activities.filter({( activity : Activity) -> Bool in
            return activity.name.lowercased().contains(searchText.lowercased())
        })

//        tableView.reloadData()
    }
//
//    func isFiltering() -> Bool {
//        return searchController.isActive && !searchBarIsEmpty()
//    }

}

extension SearchTableViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)

    }
}

extension SearchTableViewController: UISearchBarDelegate {
    // MARK: UISearchBarDelegate
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
}
