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
        
        let welcome = UILabel(frame: CGRect(x: 30, y: 50, width: 250, height: 45))
        welcome.text = "Log an activity"
        welcome.font = UIFont(name: "Karla-Bold", size: 36)
        welcome.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.view.addSubview(welcome)
        
        let searchPlaceholder = UILabel(frame: CGRect(x: 30, y: 115, width: 250, height: 40))
        searchPlaceholder.text = "Search for an activity..."
        searchPlaceholder.font = UIFont(name: "Karla-Regular", size: 18)
        searchPlaceholder.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        self.view.addSubview(searchPlaceholder)
        
        let pageScroll: UIScrollView!
        switch UIDevice().type {
        case .iPhone5S, .iPhoneSE, .iPhone6, .iPhone7, .iPhone8:
            pageScroll = UIScrollView(frame: CGRect(x: 0, y: 150, width: UIScreen.main.bounds.width, height: (UIScreen.main.bounds.height - 150)))
        default:
            pageScroll = UIScrollView(frame: CGRect(x: 0, y: 180, width: UIScreen.main.bounds.width, height: (UIScreen.main.bounds.height - 180)))
        }
        pageScroll.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 600)
        pageScroll.showsVerticalScrollIndicator = false
        
        let browseByType: UILabel
        switch UIDevice().type {
        case .iPhone5S, .iPhoneSE, .iPhone6, .iPhone7, .iPhone8:
            browseByType = UILabel(frame: CGRect(x: 30, y: 0, width: 250, height: 40))
            browseByType.font = UIFont(name: "Karla-Bold", size: 14)
        default:
            browseByType = UILabel(frame: CGRect(x: 30, y: 0, width: 250, height: 40))
            browseByType.font = UIFont(name: "Karla-Bold", size: 16)
        }
        browseByType.text = "...or browse by type"
        browseByType.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        pageScroll.addSubview(browseByType)

        
        let reducingButton: UIButton
        switch UIDevice().type {
        case .iPhoneSE,.iPhone5,.iPhone5S:
            reducingButton = UIButton(frame: CGRect(x: 0, y: 0, width: 75, height: 75))
//        case .iPhone6plus, .iPhone6Splus, .iPhone7plus, .iPhone8plus, .iPhoneXSMax:
//            reducingButton = UIButton(frame: CGRect(x: 0, y: 0, width: 90, height: 90))
        default:
            reducingButton = UIButton(frame: CGRect(x: 0, y: 0, width: 90, height: 90))
        }
        reducingButton.setImage( #imageLiteral(resourceName: "reducing-hand"), for: .normal)
        reducingButton.contentMode = .scaleAspectFit
        reducingButton.addTarget(self, action: #selector(reduce), for: .touchUpInside)
        
        let padding0 = UILabel(frame: CGRect(x: 0, y: 0, width: 75, height: 25))
        padding0.text = "error"
        padding0.textColor = .clear
        
        let reducingLabel = UILabel(frame: CGRect(x: 0, y: 10, width: 75, height: 15))
        reducingLabel.text = "Reduce"
        reducingLabel.font = UIFont(name: "Karla-Bold", size: 14)
        reducingLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        reducingLabel.textAlignment = .center
        
        
        let reducing: UIStackView
        switch UIDevice().type {
        case .iPhone6plus, .iPhone6Splus, .iPhone7plus, .iPhone8plus, .iPhoneXS, .iPhoneXSMax, .iPhoneX:
            reducing = UIStackView(arrangedSubviews: [reducingButton, padding0, reducingLabel])
        default:
            reducing = UIStackView(arrangedSubviews: [reducingButton, reducingLabel])
        }
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
        
        let padding1 = UILabel(frame: CGRect(x: 0, y: 0, width: 75, height: 25))
        padding1.text = "error"
        padding1.textColor = .clear
        
        let reusingLabel = UILabel(frame: CGRect(x: 0, y: 10, width: 75, height: 15))
        reusingLabel.text = "Reuse"
        reusingLabel.font = UIFont(name: "Karla-Bold", size: 14)
        reusingLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        reusingLabel.textAlignment = .center
        
        let reusing: UIStackView
        switch UIDevice().type {
        case .iPhone6plus, .iPhone6Splus, .iPhone7plus, .iPhone8plus, .iPhoneXS, .iPhoneXSMax, .iPhoneX:
            reusing = UIStackView(arrangedSubviews: [reusingButton, padding1, reusingLabel])
        default:
            reusing = UIStackView(arrangedSubviews: [reusingButton, reusingLabel])
        }
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
        
        let padding2 = UILabel(frame: CGRect(x: 0, y: 0, width: 75, height: 25))
        padding2.text = "error"
        padding2.textColor = .clear
        
        let recyclingLabel = UILabel(frame: CGRect(x: 0, y: 10, width: 75, height: 15))
        recyclingLabel.text = "Recycle"
        recyclingLabel.font = UIFont(name: "Karla-Bold", size: 14)
        recyclingLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        recyclingLabel.textAlignment = .center
        
        let recycling: UIStackView
        switch UIDevice().type {
        case .iPhone6plus, .iPhone6Splus, .iPhone7plus, .iPhone8plus, .iPhoneXS, .iPhoneXSMax, .iPhoneX:
            recycling = UIStackView(arrangedSubviews: [recyclingButton, padding2, recyclingLabel])
        default:
            recycling = UIStackView(arrangedSubviews: [recyclingButton, recyclingLabel])
        }
        recycling.axis = .vertical
        
        let foodButton: UIButton
        switch UIDevice().type {
        case .iPhoneSE,.iPhone5,.iPhone5S:
            foodButton = UIButton(frame: CGRect(x: 0, y: 0, width: 75, height: 75))
        default:
            foodButton = UIButton(frame: CGRect(x: 0, y: 0, width: 90, height: 90))
        }
        foodButton.setImage( #imageLiteral(resourceName: "food-spoon"), for: .normal)
        foodButton.contentMode = .scaleAspectFit
        foodButton.addTarget(self, action: #selector(foodAction), for: .touchUpInside)
        
        let padding3 = UILabel(frame: CGRect(x: 0, y: 0, width: 75, height: 25))
        padding3.text = "error"
        padding3.textColor = .clear
        
        let foodLabel = UILabel(frame: CGRect(x: 0, y: 10, width: 75, height: 15))
        foodLabel.text = "Diet"
        foodLabel.font = UIFont(name: "Karla-Bold", size: 14)
        foodLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        foodLabel.textAlignment = .center
        
        let food: UIStackView
        switch UIDevice().type {
        case .iPhone6plus, .iPhone6Splus, .iPhone7plus, .iPhone8plus, .iPhoneXS, .iPhoneXSMax, .iPhoneX:
            food = UIStackView(arrangedSubviews: [foodButton, padding3, foodLabel])
        default:
            food = UIStackView(arrangedSubviews: [foodButton, foodLabel])
        }
        food.axis = .vertical
        
        let categoryStack: UIStackView
        switch UIDevice().type {
        case .iPhoneSE,.iPhone5,.iPhone5S, .iPhone6, .iPhone7, .iPhone8:
            categoryStack = UIStackView(frame: CGRect(x: 30, y: 0, width: 400, height: 100))
//        case .iPhone6plus, .iPhone6Splus, .iPhone7plus, .iPhone8plus, .iPhoneXSMax:
//            categoryStack = UIStackView(frame: CGRect(x: 30, y: 20, width: 400, height: 140))
        default:
            categoryStack = UIStackView(frame: CGRect(x: 30, y: 0, width: 400, height: 140))
        }
        categoryStack.axis = .horizontal
        categoryStack.distribution = .fillEqually
        switch UIDevice().type {
        case .iPhone6plus, .iPhone6Splus, .iPhone7plus, .iPhone8plus, .iPhoneXS, .iPhoneXSMax, .iPhoneX:
            categoryStack.alignment = .bottom
        default:
            print("regular size alignment")
        }
        
        categoryStack.addArrangedSubview(reducing)
        categoryStack.addArrangedSubview(reusing)
        categoryStack.addArrangedSubview(recycling)
        categoryStack.addArrangedSubview(food)
        
        let scrollStack = UIScrollView(frame: CGRect(x: 0, y: 50, width: UIScreen.main.bounds.width, height: 140))
        scrollStack.contentSize = CGSize(width: 450, height: 140)
        scrollStack.addSubview(categoryStack)
        scrollStack.showsHorizontalScrollIndicator = false
        
        pageScroll.addSubview(scrollStack)
        
        let recentsLabel: UILabel!
        switch UIDevice().type {
        case .iPhone5S, .iPhoneSE, .iPhone6, .iPhone7, .iPhone8:
            recentsLabel = UILabel(frame: CGRect(x: 30, y: 200, width: 150, height: 40))
            recentsLabel.font = UIFont(name: "Karla-Bold", size: 14)
        default:
            recentsLabel = UILabel(frame: CGRect(x: 30, y: 225, width: 150, height: 40))
            recentsLabel.font = UIFont(name: "Karla-Bold", size: 16)
        }
        recentsLabel.text = "Recent activities"
        recentsLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        pageScroll.addSubview(recentsLabel)
        
        loadRecents()
        // recents collection view height: 140
        
        
        let favoritesLabel: UILabel!
        switch UIDevice().type {
        case .iPhone5S, .iPhoneSE, .iPhone6, .iPhone7, .iPhone8:
            favoritesLabel = UILabel(frame: CGRect(x: 30, y: 350, width: 150, height: 40))
            favoritesLabel.font = UIFont(name: "Karla-Bold", size: 14)
        default:
            favoritesLabel = UILabel(frame: CGRect(x: 30, y: 400, width: 150, height: 40))
            favoritesLabel.font = UIFont(name: "Karla-Bold", size: 16)
        }
        favoritesLabel.text = "Favorites"
        favoritesLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        pageScroll.addSubview(favoritesLabel)
        loadFavorites()
        //favorites collection view height: 140
        
        self.view.addSubview(pageScroll)
    }

    @objc func recycle(sender: UIButton!) {
//        self.navigationController?.pushViewController(AllStatisticsViewController(), animated: true)
    }

    @objc func reduce(sender: UIButton!) {
        CurrentActivity.sharedInstance.activity = Activity(id: 1, catID: 1, name: "Air-dried laundry", pts: 37479, kWh: 3.0, mi: nil, paper: nil, plastic: nil, water: nil)
        LogController().logActivity(multi: true, amount: 1)
        
    }
    
    @objc func reuse(sender: UIButton!) {
        
    }
    
    @objc func foodAction(sender: UIButton!) {
        
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
