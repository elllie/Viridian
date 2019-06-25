//
//  GoalViewController.swift
//  Viridian
//
//  Created by Eleanor on 6/25/19.
//

import UIKit

class GoalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        let yourImpact = UILabel(frame: CGRect(x: 30, y: 50, width: 210, height: 45))
        yourImpact.text = "Today's goal"
        yourImpact.font = UIFont(name: "Karla-Bold", size: 36)
        yourImpact.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.view.addSubview(yourImpact)
        
        let viewAll: UIButton
        switch UIDevice().type {
        case .iPhoneSE,.iPhone5,.iPhone5S:
            viewAll = UIButton(frame: CGRect(x: 30, y: 100, width: 100, height: 15))
        default:
            viewAll = UIButton(frame: CGRect(x: 250, y: 70, width: 100, height: 15))
        }
        viewAll.setTitle("Your impact >", for: .normal)
        viewAll.titleLabel?.font = UIFont(name: "Karla-Bold", size: 14)
        viewAll.setTitleColor(UIColor(named: "darkTint"), for: .normal)
        viewAll.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.view.addSubview(viewAll)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @objc func buttonAction(sender: UIButton!) {
        self.navigationController?.pushViewController(AllStatisticsViewController(), animated: true)
    }
}
