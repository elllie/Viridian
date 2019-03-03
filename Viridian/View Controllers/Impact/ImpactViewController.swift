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
        
        Top10().collect()
        if (Top10().entries.count < 100) {
//            youShouldLogMore()
            print(Top10().reduceStats())
            stackTop10()
        } else {
            print(Top10().statsCount())
        }
        // Do any additional setup after loading the view.
    }
    
    
    @objc func buttonAction(sender: UIButton!) {
        self.navigationController?.pushViewController(AllStatisticsViewController(), animated: true)
    }
    
    func stackTop10() {
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 110, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 175))
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 5000)
        
        let statStack = UIStackView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 5000))
        
 
        
        let topStats = Top10().reduceStats()
        for i in 0...9 {
            var yOffset = 0
            if (i > 0) {
                yOffset = 150
            }
            let third = UIView(frame: CGRect(x: 0, y: yOffset, width: Int(UIScreen.main.bounds.width), height: 550))
            let picture = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 550))
            let bigLabel: UILabel!
            let smallLabel: UILabel!
            
            var align: LabelAlignment
            
            var title: String
            var subtitle: String?
            var titleColor: UIColor
            
            switch (topStats[i]) {
            case 1:
                align = .rightHalf
                picture.image = #imageLiteral(resourceName: "kWh")
                title = (Statistics().calculateTable()[1] + " kWh saved in total")
                subtitle = Statistics().kWhImportance()
                titleColor = .white
            case 11:
                align = .rightThirdQuarter
                picture.image = #imageLiteral(resourceName: "gallonsWater")
                title = (Statistics().calculateTable()[18] + " gal of water saved")
                subtitle = Statistics().waterImportance()
                titleColor = .white
            default:
                align = .center
                title = ""
                subtitle = ""
                titleColor = .white
            }
            
            switch (align) {
            case .leftThirdQuarter:
                bigLabel = UILabel(frame: CGRect(x: 30, y: 200, width: Int(UIScreen.main.bounds.width * 0.75) - 30, height: 100))
                smallLabel = UILabel(frame: CGRect(x: 30, y: 250, width: Int(UIScreen.main.bounds.width * 0.75) - 30, height: 100))
            case .rightThirdQuarter:
                bigLabel = UILabel(frame: CGRect(x: Int(UIScreen.main.bounds.width / 4) - 30, y: 215, width: Int(UIScreen.main.bounds.width * 0.75), height: 100))
                smallLabel = UILabel(frame: CGRect(x: Int(UIScreen.main.bounds.width / 4), y: 255, width: Int(UIScreen.main.bounds.width * 0.75) - 30, height: 100))
                
                bigLabel.textAlignment = .right
                smallLabel.textAlignment = .right
            case .leftHalf:
                bigLabel = UILabel(frame: CGRect(x: 30, y: 250, width: Int((UIScreen.main.bounds.width / 2) - 30), height: 100))
                smallLabel = UILabel(frame: CGRect(x: 30, y: 300, width: Int((UIScreen.main.bounds.width / 2) - 30), height: 100))
            case .rightHalf:
                bigLabel = UILabel(frame: CGRect(x: Int(UIScreen.main.bounds.midX), y: 215, width: Int((UIScreen.main.bounds.midX - 30)), height: 100))
                smallLabel = UILabel(frame: CGRect(x: Int(UIScreen.main.bounds.midX), y: 255, width: Int((UIScreen.main.bounds.width / 2) - 30), height: 100))
            default:
                bigLabel = UILabel(frame: CGRect(x: Int(UIScreen.main.bounds.midX), y: 250, width: Int((UIScreen.main.bounds.midX - 30)), height: 100))
                smallLabel = UILabel(frame: CGRect(x: Int(UIScreen.main.bounds.midX), y: 300, width: Int((UIScreen.main.bounds.width / 2) - 30), height: 100))
            }
            
            picture.contentMode = .scaleAspectFit
            
            bigLabel.font = UIFont(name: "Karla-Bold", size: 24)
            bigLabel.text = title
            bigLabel.textColor = titleColor
            bigLabel.numberOfLines = 0
            
            smallLabel.font = UIFont(name: "Karla-Regular", size: 16)
            smallLabel.text = subtitle
            smallLabel.textColor = titleColor
            smallLabel.numberOfLines = 0
            
            third.addSubview(picture)
            third.addSubview(bigLabel)
            third.addSubview(smallLabel)
            
            statStack.addSubview(third)
        }
        
        scrollView.addSubview(statStack)
        self.view.addSubview(scrollView)
    }
    
    func youShouldLogMore() {
        let emptyIcon: UIImageView
        switch UIDevice().type {
        case .iPhone6plus, .iPhone6Splus, .iPhone7plus, .iPhone8plus:
            emptyIcon = UIImageView(frame: CGRect(x: 10, y: 200, width: (UIScreen.main.bounds.width - 20), height: 200))
        case .iPhoneX, .iPhoneXR, .iPhoneXS, .iPhoneXSMax:
            emptyIcon = UIImageView(frame: CGRect(x: 10, y: 250, width: (UIScreen.main.bounds.width - 20), height: 175))
        default:
            emptyIcon = UIImageView(frame: CGRect(x: 10, y: 200, width: (UIScreen.main.bounds.width - 20), height: 150))
        }
        emptyIcon.image = #imageLiteral(resourceName: "sprout")
        emptyIcon.contentMode = .scaleAspectFit
        emptyIcon.isUserInteractionEnabled = false
        emptyIcon.isOpaque = true
        self.view.addSubview(emptyIcon)
        
        let logMoreLabel: UILabel
        switch UIDevice().type {
        case .iPhone6plus, .iPhone6Splus, .iPhone7plus, .iPhone8plus:
            logMoreLabel = UILabel(frame: CGRect(x: 50, y: 375, width: (UIScreen.main.bounds.width - 100), height: 200))
            logMoreLabel.font = UIFont(name: "Karla-Regular", size: 20)
        case .iPhoneX, .iPhoneXR, .iPhoneXS, .iPhoneXSMax:
            logMoreLabel = UILabel(frame: CGRect(x: 40, y: 450, width: (UIScreen.main.bounds.width - 80), height: 175))
            logMoreLabel.font = UIFont(name: "Karla-Regular", size: 20)
        default:
            logMoreLabel = UILabel(frame: CGRect(x: 30, y: 350, width: (UIScreen.main.bounds.width - 60), height: 150))
            logMoreLabel.font = UIFont(name: "Karla-Regular", size: 18)
        }
        logMoreLabel.text = "You haven't logged many activities yet!  Viridian will display your greenest achievements when it has enough data."
        logMoreLabel.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        logMoreLabel.textAlignment = .center
        logMoreLabel.numberOfLines = 0
        self.view.addSubview(logMoreLabel)
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
