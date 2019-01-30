//
//  LogViewController.swift
//  Vridian
//
//  Created by Eleanor on 1/23/19.
//

import UIKit

class LoggingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white

        // Do any additional setup after loading the view.
        
        let welcome = UILabel(frame: CGRect(x: 30, y: 50, width: 250, height: 40))
        welcome.text = "Log an activity"
        welcome.font = UIFont(name: "Karla-Bold", size: 36)
        welcome.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.view.addSubview(welcome)
        
        let searchPlaceholder = UILabel(frame: CGRect(x: 30, y: 115, width: 250, height: 40))
        searchPlaceholder.text = "Search for an activity..."
        searchPlaceholder.font = UIFont(name: "Karla-Regular", size: 18)
        searchPlaceholder.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        self.view.addSubview(searchPlaceholder)
        
        let browseByType: UILabel
        switch UIDevice().type {
        case .iPhone5S, .iPhoneSE, .iPhone6, .iPhone7, .iPhone8:
            browseByType = UILabel(frame: CGRect(x: 30, y: 150, width: 250, height: 40))
            browseByType.font = UIFont(name: "Karla-Bold", size: 14)
        default:
            browseByType = UILabel(frame: CGRect(x: 30, y: 180, width: 250, height: 40))
            browseByType.font = UIFont(name: "Karla-Bold", size: 16)
        }
        browseByType.text = "...or browse by type"
        browseByType.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.view.addSubview(browseByType)
        
        let reducingButton: UIButton
        switch UIDevice().type {
        case .iPhoneSE,.iPhone5,.iPhone5S:
            reducingButton = UIButton(frame: CGRect(x: 0, y: 0, width: 75, height: 75))
//        case .iPhone6plus, .iPhone6Splus, .iPhone7plus, .iPhone8plus, .iPhoneXSMax:
//            reducingButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        default:
            reducingButton = UIButton(frame: CGRect(x: 0, y: 0, width: 90, height: 90))
        }
        reducingButton.setImage( #imageLiteral(resourceName: "reducing-hand"), for: .normal)
        reducingButton.contentMode = .scaleAspectFit
        reducingButton.addTarget(self, action: #selector(reduce), for: .touchUpInside)
        
        let reducingLabel = UILabel(frame: CGRect(x: 0, y: 10, width: 75, height: 15))
        reducingLabel.text = "Reduce"
        reducingLabel.font = UIFont(name: "Karla-Bold", size: 14)
        reducingLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        reducingLabel.textAlignment = .center
        
        let reducing = UIStackView(arrangedSubviews: [reducingButton, reducingLabel])
        reducing.axis = .vertical
        
        let reusingButton: UIButton
        switch UIDevice().type {
        case .iPhoneSE,.iPhone5,.iPhone5S:
            reusingButton = UIButton(frame: CGRect(x: 0, y: 0, width: 75, height: 75))
//        case .iPhone6plus, .iPhone6Splus, .iPhone7plus, .iPhone8plus, .iPhoneXSMax:
//            reusingButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        default:
            reusingButton = UIButton(frame: CGRect(x: 0, y: 0, width: 90, height: 90))
        }
        reusingButton.setImage( #imageLiteral(resourceName: "reusing-paperhat"), for: .normal)
        reusingButton.contentMode = .scaleAspectFit
        reusingButton.addTarget(self, action: #selector(reuse), for: .touchUpInside)
        
        let reusingLabel = UILabel(frame: CGRect(x: 0, y: 10, width: 75, height: 15))
        reusingLabel.text = "Reuse"
        reusingLabel.font = UIFont(name: "Karla-Bold", size: 14)
        reusingLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        reusingLabel.textAlignment = .center
        
        let reusing = UIStackView(arrangedSubviews: [reusingButton, reusingLabel])
        reusing.axis = .vertical
        
        let recyclingButton: UIButton
        switch UIDevice().type {
        case .iPhoneSE,.iPhone5,.iPhone5S:
            recyclingButton = UIButton(frame: CGRect(x: 0, y: 0, width: 75, height: 75))
//        case .iPhone6plus, .iPhone6Splus, .iPhone7plus, .iPhone8plus, .iPhoneXSMax:
//            recyclingButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        default:
            recyclingButton = UIButton(frame: CGRect(x: 0, y: 0, width: 90, height: 90))
        }
        recyclingButton.setImage( #imageLiteral(resourceName: "recycling-bin"), for: .normal)
        recyclingButton.contentMode = .scaleAspectFit
        recyclingButton.addTarget(self, action: #selector(recycle), for: .touchUpInside)
        
        let recyclingLabel = UILabel(frame: CGRect(x: 0, y: 10, width: 75, height: 15))
        recyclingLabel.text = "Recycle"
        recyclingLabel.font = UIFont(name: "Karla-Bold", size: 14)
        recyclingLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        recyclingLabel.textAlignment = .center
        
        let recycling = UIStackView(arrangedSubviews: [recyclingButton, recyclingLabel])
        recycling.axis = .vertical
        
        let foodButton: UIButton
        switch UIDevice().type {
        case .iPhoneSE,.iPhone5,.iPhone5S:
            foodButton = UIButton(frame: CGRect(x: 0, y: 0, width: 75, height: 75))
//        case .iPhone6plus, .iPhone6Splus, .iPhone7plus, .iPhone8plus, .iPhoneXSMax:
//            foodButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        default:
            foodButton = UIButton(frame: CGRect(x: 0, y: 0, width: 90, height: 90))
        }
        foodButton.setImage( #imageLiteral(resourceName: "food-spoon"), for: .normal)
        foodButton.contentMode = .scaleAspectFit
        foodButton.addTarget(self, action: #selector(food), for: .touchUpInside)
        
        let categoryStack: UIStackView
        switch UIDevice().type {
        case .iPhoneSE,.iPhone5,.iPhone5S:
            categoryStack = UIStackView(frame: CGRect(x: 30, y: 0, width: 400, height: 100))
        case .iPhone6plus, .iPhone6Splus, .iPhone7plus, .iPhone8plus, .iPhoneXSMax:
            categoryStack = UIStackView(frame: CGRect(x: 30, y: 20, width: 400, height: 130))
        default:
            categoryStack = UIStackView(frame: CGRect(x: 30, y: 0, width: 400, height: 120))
        }
        categoryStack.axis = .horizontal
        categoryStack.distribution = .fillEqually
        
        categoryStack.addArrangedSubview(reducing)
        categoryStack.addArrangedSubview(reusing)
        categoryStack.addArrangedSubview(recycling)
        categoryStack.addArrangedSubview(foodButton)
        
        let scrollStack = UIScrollView(frame: CGRect(x: 0, y: 200, width: UIScreen.main.bounds.width, height: 130))
        scrollStack.contentSize = CGSize(width: 400, height: 130)
        scrollStack.addSubview(categoryStack)
        
        self.view.addSubview(scrollStack)
        
        loadRecents()
        loadFavorites()
    }

    @objc func recycle(sender: UIButton!) {
//        self.navigationController?.pushViewController(AllStatisticsViewController(), animated: true)
    }

    @objc func reduce(sender: UIButton!) {
        
    }
    
    @objc func reuse(sender: UIButton!) {
        
    }
    
    @objc func food(sender: UIButton!) {
        
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
