//
//  AllStatisticsViewController.swift
//  Vridian
//
//  Created by Eleanor on 1/26/19.
//

import UIKit

class AllStatisticsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.font = UIFont(name: "Karla-Regular", size: 14)
        header.textLabel?.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        header.textLabel?.frame = header.frame
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = name[indexPath.row]
        cell.textLabel?.font = UIFont(name: "Karla-Bold", size: 16)
        cell.detailTextLabel?.text = numbers[indexPath.row]
        cell.detailTextLabel?.font = UIFont(name: "Karla-Regular", size: 16)
        cell.detailTextLabel?.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        cell.isUserInteractionEnabled = false
        return cell
    }
    
    
    let sections = ["All values are approximate"]
    let name = ["CO2 emissions reduced (lbs)", "Energy saved (kWh)", "Fuel savings (gal)", "Green miles traveled", "    from public transportation", "    on foot", "Number of times composted", "Number of times recycled", "    cans", "    paper", "    plastic", "    glass", "    batteries/electronics", "    other", "Paper saved (lbs)", "Plastic saved (lbs)", "    from bottles", "    from bags", "Water saved (gal)"]
    
//    let numbers = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18"]
    
    var numbers: [String] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18"]
    
    override func viewWillAppear(_ animated: Bool) {
        numbers = Statistics().calculateTable()
        Amplitude.instance()?.logEvent("Viewed all statistics")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
       // self.navigationController?.navigationBar.isHidden = true
        
        let back = UIButton(frame: CGRect(x: 20, y: 50, width: 20, height: 40))
        back.setTitle("<", for: .normal)
        back.titleLabel?.font = UIFont(name: "Karla-Bold", size: 36)
        back.setTitleColor(UIColor(named: "darkTint"), for: .normal)
        back.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        self.view.addSubview(back)
        
        let yourImpact = UILabel(frame: CGRect(x: 55, y: 50, width: 220, height: 40))
        yourImpact.text = "Your impact" // Total impact
        yourImpact.font = UIFont(name: "Karla-Bold", size: 36)
        yourImpact.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.view.addSubview(yourImpact)
        
        let viewAll: UIButton
        switch UIDevice().type {
        case .iPhoneSE,.iPhone5,.iPhone5S:
            viewAll = UIButton(frame: CGRect(x: 20, y: 100, width: 100, height: 15))
        default:
            viewAll = UIButton(frame: CGRect(x: 270, y: 70, width: 100, height: 15))
        }
        viewAll.setTitle("All entries >", for: .normal)
        viewAll.titleLabel?.font = UIFont(name: "Karla-Bold", size: 14)
        viewAll.setTitleColor(UIColor(named: "darkTint"), for: .normal)
        viewAll.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.view.addSubview(viewAll)
        
        // Do any additional setup after loading the view.
//        let table: UITableViewController = AllStatisticsTableController()
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
        tableView.register(AllStatCell.self, forCellReuseIdentifier: "cell")

        self.view.addSubview(tableView)
    }
    
    @objc func backAction(sender: UIButton!) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func buttonAction(sender: UIButton) {
        self.navigationController?.pushViewController(EntriesTableViewController(), animated: true)
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        let backItem = UIBarButtonItem()
        backItem.title = "<"
        
        navigationItem.backBarButtonItem = backItem // This will show in the next view controller being pushed
        // Pass the selected object to the new view controller.
    }
    
    

}
