//
//  Top10Picker.swift
//  Viridian
//
//  Created by Eleanor on 3/3/19.
//

import UIKit

extension ImpactViewController {
    
    func stackTop5() {
        let scrollView: UIScrollView!
        
        switch UIDevice().type {
        case .iPhone5S, .iPhoneSE:
            scrollView = UIScrollView(frame: CGRect(x: 0, y: 125, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 150))
            scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 650)
        case .iPhone6, .iPhone6S, .iPhone7, .iPhone8, .iPhone6plus, .iPhone6Splus, .iPhone7plus, .iPhone8plus:
            scrollView = UIScrollView(frame: CGRect(x: 0, y: 110, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 150))
            scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 790)
        case .iPhoneXR, .iPhoneXSMax:
            scrollView = UIScrollView(frame: CGRect(x: 0, y: 110, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 175))
            scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 790)
        default:
            scrollView = UIScrollView(frame: CGRect(x: 0, y: 110, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 175))
            scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 760)
        }
        
        
        scrollView.showsVerticalScrollIndicator = false
        
        let statStack = UIStackView(frame: CGRect(x: 0, y: -190, width: UIScreen.main.bounds.width, height: 760))
        if (UIDevice().type == .iPhone6plus || UIDevice().type == .iPhone6Splus || UIDevice().type == .iPhone7plus || UIDevice().type == .iPhone8plus || UIDevice().type == .iPhoneXR || UIDevice().type == .iPhoneXSMax) {
            statStack.frame = CGRect(x: 0, y: -180, width: UIScreen.main.bounds.width, height: 790)
        }
        
        let topStats = Top5().reduceStats()
        for i in 0...4 {
            let yOffset: Int
            switch UIDevice().type {
            case .iPhone5S, .iPhoneSE:
                yOffset = 127
            default:
                yOffset = 150
            }
            let third = UIView(frame: CGRect(x: 0, y: i * yOffset, width: Int(UIScreen.main.bounds.width), height: 550))
            let picture = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 550))
            let bigLabel: UILabel!
            let smallLabel: UILabel!
            
            var align: LabelAlignment
            
            var title: String
            var subtitle: String?
            var titleColor: UIColor
            
            switch (topStats[i]) {
            case 1:
                align = .rightThirdQuarter
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
            case 3, 4:
                align = .center
                picture.image = #imageLiteral(resourceName: "food")
                title = (Statistics().calculateTable()[19] + " meatless meals consumed")
                subtitle = "Cutting meat and dairy is the biggest thing you can do for your carbon footprint."
                titleColor = UIColor(named: "darkTint") ?? .black
            case 5:
                align = .center
                picture.image = #imageLiteral(resourceName: "food")
                title = Statistics().calculateTable()[20] + " leftover \n meals eaten"
                subtitle = "Roughly 1/3 (over a billion tons) of all the food in the world gets lost or put to waste."
                titleColor = UIColor(named: "darkTint") ?? .black
            case 6, 15, 17:
                align = .rightThirdQuarter
                picture.image = #imageLiteral(resourceName: "vinesleft")
                title = "Did you know?"
                subtitle = "  Precious metals from e-waste can be up to 50 times richer than ores mined from the earth."
                titleColor = UIColor(named: "blueTint") ?? .black
            case 9, 10:
                align = .rightThirdQuarter
                picture.image = #imageLiteral(resourceName: "cafesign")
                title = " disposable cups saved"
                subtitle = "At $5 a drink, you've saved enough to start a retirement account..."
                titleColor = .black
                // plastic bags rescued from landfill
            case 12: // fix this piiiccc
                align = .rightThirdQuarter
                picture.image = #imageLiteral(resourceName: "trees")
                title = Statistics().calculateTable()[0] + " lbs carbon emissions reduced"
                subtitle = "Equivalent to planting " + String(Int(Statistics().calculateTable()[0]) ?? 0 / 40) + " trees"
                titleColor = .black
            case 14:
                align = .rightThirdQuarter
                picture.image = #imageLiteral(resourceName: "vinesleft")
                title = "#GreenFacts"
                subtitle = "A 2017 CDP report found that 71% of global emissions come from just 100 companies."
                titleColor = UIColor(named: "blueTint") ?? .black
                // green miles traveled
                // gallons of gas saved
                // times composted?
            case 19, 20, 23, 26:
                align = .rightThirdQuarter
                picture.image = #imageLiteral(resourceName: "vinesleft")
                title = ""
                subtitle = "Many materials (specialty plastics, textiles, glass) are thrown away by local recycling plants. Make sure yours actually recycles them."
                titleColor = UIColor(named: "blueTint") ?? .black
            case 7, 18, 24, 27:
                align = .leftHalf
                picture.image = #imageLiteral(resourceName: "paper1")
                title = Statistics().paperMeasurement()
                subtitle = Statistics().paperImportance()
                titleColor = .black
            case 8, 11, 21, 25:
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
            case 28, 29:
                align = .center
                picture.image = #imageLiteral(resourceName: "gradient")
                title = Statistics().calculateTable()[3] + " green miles traveled"
                subtitle = Statistics().mileage()
                titleColor = .white
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
            
            switch UIDevice().type {
            case .iPhoneSE, .iPhone5S:
                bigLabel.font = UIFont(name: "Karla-Bold", size: 22)
                smallLabel.font = UIFont(name: "Karla-Regular", size: 14)
            default:
                bigLabel.font = UIFont(name: "Karla-Bold", size: 24)
                smallLabel.font = UIFont(name: "Karla-Regular", size: 16)
            }
            
            bigLabel.text = title
            bigLabel.textColor = titleColor
            bigLabel.numberOfLines = 0
            
            
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
}
