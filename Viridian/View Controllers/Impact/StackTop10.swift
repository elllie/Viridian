//
//  Top10Picker.swift
//  Viridian
//
//  Created by Eleanor on 3/3/19.
//

import UIKit

extension ImpactViewController {
    
    func stackTop10() {
        let scrollView: UIScrollView!
        switch UIDevice().type {
        case .iPhone5S, .iPhoneSE:
            scrollView = UIScrollView(frame: CGRect(x: 0, y: 110, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 150))
        default:
            scrollView = UIScrollView(frame: CGRect(x: 0, y: 110, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 175))
        }
        
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 1520)
        scrollView.showsVerticalScrollIndicator = false
        
        let statStack = UIStackView(frame: CGRect(x: 0, y: -190, width: UIScreen.main.bounds.width, height: 1520))
        
        
        let topStats = Top10().reduceStats()
        for i in 0...9 {
            let yOffset = 150
            let third = UIView(frame: CGRect(x: 0, y: i * yOffset, width: Int(UIScreen.main.bounds.width), height: 550))
            let picture = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 550))
            let bigLabel: UILabel!
            let smallLabel: UILabel!
            
            var align: LabelAlignment
            
            var title: String
            var subtitle: String?
            var titleColor: UIColor
            
            switch (topStats[i]) {
            case 1, 6:
                align = .rightHalf
                picture.image = #imageLiteral(resourceName: "kWh")
                title = (Statistics().calculateTable()[1] + " kWh saved in total")
                subtitle = Statistics().kWhImportance()
                titleColor = .white
            case 2:
                align = .rightThirdQuarter
                picture.image = #imageLiteral(resourceName: "gallonsWater")
                title = (Statistics().calculateTable()[18] + " gal of water saved")
                subtitle = Statistics().waterImportance()
                titleColor = .white
            case 3, 4, 5:
                align = .center
                picture.image = #imageLiteral(resourceName: "food")
                title = (Statistics().calculateTable()[19] + " meatless meals consumed")
                subtitle = "Cutting meat and dairy is the biggest thing you can do for your carbon footprint!"
                titleColor = UIColor(named: "darkTint") ?? .black
//            case 6: refurbished or used device
            //            case 17, 15: toxic waste statistics or recycling
            case 7, 18, 24, 27:
                align = .leftHalf
                picture.image = #imageLiteral(resourceName: "paper1")
                title = Statistics().paperMeasurement()
                subtitle = Statistics().paperImportance()
                titleColor = .black
            case 8, 9, 11, 21, 25:
                align = .leftThirdQuarter
                picture.image = #imageLiteral(resourceName: "plastic")
                title = (Statistics().calculateTable()[15] + " lbs of plastic saved")
                subtitle = Statistics().plasticImportance()
                titleColor = .black
            case 13, 22:
                align = .rightThirdQuarter
                picture.image = #imageLiteral(resourceName: "bottles")
                title = String(Int((Float(Statistics().calculateTable()[16])! * 454) / 13)) + " plastic bottles rescued from \n landfill"
                subtitle = ""
                titleColor = .black
            case 16:
                align = .leftThirdQuarter
                picture.image = #imageLiteral(resourceName: "cans")
                title = Statistics().calculateTable()[8] + " cans recycled"
                subtitle = "It takes 90% less energy to manufacture a can from recycled aluminum!"
                titleColor = UIColor(named: "darkTint") ?? .black
            default:
                align = .center
                picture.image = #imageLiteral(resourceName: "kWh")
                title = "NOP"
                subtitle = "nop"
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
                bigLabel = UILabel(frame: CGRect(x: 30, y: 210, width: Int(UIScreen.main.bounds.width / 2), height: 100))
                smallLabel = UILabel(frame: CGRect(x: 30, y: 260, width: Int(UIScreen.main.bounds.width / 2), height: 100))
            case .rightHalf:
                bigLabel = UILabel(frame: CGRect(x: Int(UIScreen.main.bounds.midX), y: 215, width: Int((UIScreen.main.bounds.midX - 30)), height: 100))
                smallLabel = UILabel(frame: CGRect(x: Int(UIScreen.main.bounds.midX), y: 255, width: Int((UIScreen.main.bounds.width / 2) - 30), height: 100))
                
                bigLabel.textAlignment = .right
                smallLabel.textAlignment = .right
            case .center:
                bigLabel = UILabel(frame: CGRect(x: 35, y: 200, width: Int(UIScreen.main.bounds.width * 0.8), height: 100))
                smallLabel = UILabel(frame: CGRect(x: 70, y: 265, width: Int(UIScreen.main.bounds.width * 0.6), height: 100))
                
                bigLabel.textAlignment = .center
                smallLabel.textAlignment = .center
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
}
