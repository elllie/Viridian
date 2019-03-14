//
//  ImpactViewController.swift
//  Vridian
//
//  Created by Eleanor on 1/23/19.
//

import UIKit

class ImpactViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        let yourImpact = UILabel(frame: CGRect(x: 30, y: 50, width: 210, height: 40))
        yourImpact.text = "Your impact"
        yourImpact.font = UIFont(name: "Karla-Bold", size: 36)
        yourImpact.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.view.addSubview(yourImpact)
        
        let viewAll: UIButton
        switch UIDevice().type {
            case .iPhoneSE,.iPhone5,.iPhone5S:
            viewAll = UIButton(frame: CGRect(x: 30, y: 100, width: 70, height: 15))
            default:
            viewAll = UIButton(frame: CGRect(x: 250, y: 70, width: 70, height: 15))
        }
        viewAll.setTitle("View all >", for: .normal)
        viewAll.titleLabel?.font = UIFont(name: "Karla-Bold", size: 14)
        viewAll.setTitleColor(UIColor(named: "darkTint"), for: .normal)
        viewAll.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.view.addSubview(viewAll)
        
        let settings: UIButton
        switch UIDevice().type {
            case .iPhoneSE, .iPhone5, .iPhone5S:
            settings = UIButton(frame: CGRect(x: UIScreen.main.bounds.width - 50, y: 60, width: 25, height: 25))
            default:
            settings = UIButton(frame: CGRect(x: UIScreen.main.bounds.width - 40, y: 60, width: 25, height: 25))
        }
        settings.setImage(UIImage(named: "settings"), for: .normal)
        settings.tintColor = UIColor(named: "darkTint")
        settings.addTarget(self, action: #selector(settingsAction), for: .touchUpInside)
        self.view.addSubview(settings)
        
        Top10().collect()
        if (Top10().entries.count < 100 || Top10().reduceStats().contains(0)) {
            youShouldLogMore()
//            stackTop10()
        } else {
            stackTop10()
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if Statistics.dataHasChanged {
//            Top10().collect()
//            if (Top10().entries.count < 100 || Top10().reduceStats().contains(0)) {
//                //            youShouldLogMore()
//                stackTop10()
//            } else {
//                stackTop10()
//            }
            Statistics.dataHasChanged = false
        }
    }
    
    @objc func buttonAction(sender: UIButton!) {
        self.navigationController?.pushViewController(AllStatisticsViewController(), animated: true)
    }
    
    @objc func settingsAction(sender: UIButton!) {
        self.navigationController?.pushViewController(SettingsViewController(), animated: true)
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
