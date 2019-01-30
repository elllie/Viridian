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
        logMoreLabel.text = "You haven't logged many activities yet!  Vridian will display your greenest achievements when it has enough data."
        logMoreLabel.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        logMoreLabel.textAlignment = .center
        logMoreLabel.numberOfLines = 0
        self.view.addSubview(logMoreLabel)
        // Do any additional setup after loading the view.
    }
    
    
    @objc func buttonAction(sender: UIButton!) {
        self.navigationController?.pushViewController(AllStatisticsViewController(), animated: true)
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
