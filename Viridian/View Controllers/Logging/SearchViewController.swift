//
//  SearchViewController.swift
//  Viridian
//
//  Created by Eleanor on 4/8/19.
//

import UIKit

class SearchViewController: UIViewController, UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate {
    
    let activities = Activity.allActivities
    var filteredActivities = [Activity]()
    
    
    // MARK: Table view delegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
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
    
    // MARK: Text field delegate (?)
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        let back = UIButton(frame: CGRect(x: 20, y: 50, width: 20, height: 40))
        back.setTitle("<", for: .normal)
        back.titleLabel?.font = UIFont(name: "Karla-Bold", size: 36)
        back.setTitleColor(UIColor(named: "darkTint"), for: .normal)
        back.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        self.view.addSubview(back)
        
        let searchBar = UITextField(frame: CGRect(x: 50, y: 50, width: UIScreen.main.bounds.width - 70, height: 40))
        searchBar.drawPlaceholder(in: CGRect(x: 150, y: 50, width: UIScreen.main.bounds.width - 75, height: 35))
        searchBar.placeholder = "Search for an activity..."
        searchBar.textAlignment = .left
        searchBar.font = UIFont(name: "Karla-Regular", size: 18)
        searchBar.delegate = self
        self.view.addSubview(searchBar)
        
        let tableView: UITableView
        switch UIDevice().type {
        case .iPhoneSE,.iPhone5,.iPhone5S:
            tableView = UITableView(frame: CGRect(x: 0, y: 125, width: UIScreen.main.bounds.width, height: (UIScreen.main.bounds.height)), style: .grouped)
        default:
            tableView = UITableView(frame: CGRect(x: 0, y: 100, width: UIScreen.main.bounds.width, height: (UIScreen.main.bounds.height)), style: .grouped)
        }
        tableView.contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 100, right: 0.0)
        tableView.backgroundColor = nil
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)

        // Do any additional setup after loading the view.
    }
    
    @objc func backAction(sender: UIButton!) {
        self.navigationController?.popViewController(animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
