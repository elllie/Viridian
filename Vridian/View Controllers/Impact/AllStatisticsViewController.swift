//
//  AllStatisticsViewController.swift
//  Vridian
//
//  Created by Eleanor on 1/26/19.
//

import UIKit

class AllStatisticsViewController: UIViewController {

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
        yourImpact.text = "Total impact"
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
        let table: UITableViewController = AllStatisticsTableController()
        let tableView = UITableView(frame: CGRect(x: 0, y: 150, width: UIScreen.main.bounds.width, height: 500), style: .grouped)
        tableView.register(AllStatCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = table
        tableView.delegate = table
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
