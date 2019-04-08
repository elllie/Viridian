//
//  LogViewController.swift
//  Vridian
//
//  Created by Eleanor on 1/23/19.
//

import UIKit
import CoreData

class LoggingViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    var activities: [Activity] = []
    
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    var moc: NSManagedObjectContext!
    let persistentContainer = NSPersistentContainer(name: "Vridian")
    var entries: [Diary] = []
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (activities.count <= 6) {
            return activities.count
        } else {
            return 6
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "coll", for: indexPath) as! RecentsCollectionViewCell
        cell.picture.image = activities[indexPath.row].image
        cell.label.text = activities[indexPath.row].name
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        switch UIDevice().type {
        case .iPhone5, .iPhoneSE:
            return CGSize(width: 75, height: 115)
        default:
            return CGSize(width: 90, height: 130)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        switch UIDevice().type {
        case .iPhoneSE, .iPhone5S://, .iPhone6plus, .iPhone6Splus, .iPhone7plus, .iPhone8plus:
            return UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
        default:
            return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //let cell = collectionView.cellForItem(at: indexPath)
        if (activities[indexPath.row] is XActivity) {
            Activity.CurrentActivity = activities[indexPath.row]
            let detailView = TypeAViewController()
            detailView.titleLabelText = activities[indexPath.row].name
            detailView.iconViewImage = activities[indexPath.row].image
            detailView.howManyLabelText = (activities[indexPath.row] as! XActivity).howMany
            detailView.tipLabelText = Tip.pick(activity: Activity.CurrentActivity!)
            self.navigationController?.pushViewController(detailView, animated: true)
        }
        else {
            let detailView = TypeBViewController()
            Activity.CurrentActivity = activities[indexPath.row]
            detailView.titleLabelText = activities[indexPath.row].name
            detailView.iconViewImage = activities[indexPath.row].image
            detailView.tipLabelText = Tip.pick(activity: Activity.CurrentActivity!)
            self.navigationController?.pushViewController(detailView, animated: true)
        }
        Amplitude.instance()?.logEvent("Picked recent activity", withEventProperties: ["Activity ID": Activity.CurrentActivity?.id ?? 0])
        print(activities[indexPath.row].name)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        activities = displayRecents()
        self.navigationController!.navigationBar.isHidden = true
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white

        // Do any additional setup after loading the view.
        
        let welcome = UILabel(frame: CGRect(x: 30, y: 50, width: 250, height: 45))
        welcome.text = "Log an activity"
        switch UIDevice().type {
        case .iPhoneSE, .iPhone5S:
            welcome.font = UIFont(name: "Karla-Bold", size: 32)
        default:
            welcome.font = UIFont(name: "Karla-Bold", size: 36)
        }
        
        welcome.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.view.addSubview(welcome)
        
        let searchPlaceholder = UIButton(type: UIButton.ButtonType.system)
        switch UIDevice().type {
        case .iPhoneSE, .iPhone5S:
            searchPlaceholder.frame = CGRect(x: 15, y: 110, width: UIScreen.main.bounds.width - 30, height: 30)
            searchPlaceholder.titleLabel?.font = UIFont(name: "Karla-Bold", size: 16)
        default:
            searchPlaceholder.frame = CGRect(x: 30, y: 115, width: UIScreen.main.bounds.width - 60, height: 40)
            searchPlaceholder.titleLabel?.font = UIFont(name: "Karla-Bold", size: 18)
        }
        searchPlaceholder.setTitle("Search for an activity...", for: .normal)
        searchPlaceholder.titleLabel?.textAlignment = .left
        searchPlaceholder.setTitleColor(UIColor(named: "viridian"), for: .normal)
        searchPlaceholder.setImage(UIImage(named: "search"), for: .normal)
        searchPlaceholder.imageView?.contentMode = .scaleAspectFit
        searchPlaceholder.imageEdgeInsets = UIEdgeInsets(top: 0, left: -60, bottom: 0, right: 0)
        searchPlaceholder.tintColor = UIColor(named: "viridian")
        searchPlaceholder.backgroundColor = #colorLiteral(red: 0.8274509804, green: 0.9058823529, blue: 0.5764705882, alpha: 0.1028467465)
        searchPlaceholder.addTarget(self, action: #selector(searchAction), for: .touchUpInside)
        self.view.addSubview(searchPlaceholder)
        
        
        
        let pageScroll: UIScrollView!
        switch UIDevice().type {
        case .iPhone5S, .iPhoneSE:
            pageScroll = UIScrollView(frame: CGRect(x: 0, y: 150, width: UIScreen.main.bounds.width, height: (UIScreen.main.bounds.height - 150)))
        default:
            pageScroll = UIScrollView(frame: CGRect(x: 0, y: 180, width: UIScreen.main.bounds.width, height: (UIScreen.main.bounds.height - 180)))
        }
        pageScroll.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 600)
        pageScroll.showsVerticalScrollIndicator = false
        
        let browseByType: UILabel
        switch UIDevice().type {
        case .iPhone5S, .iPhoneSE, .iPhone6, .iPhone6S, .iPhone7, .iPhone8:
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
        case .iPhoneSE,.iPhone5,.iPhone5S, .iPhone6, .iPhone6S, .iPhone7, .iPhone8:
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
        case .iPhone5S, .iPhoneSE, .iPhone6, .iPhone6S, .iPhone7, .iPhone8:
            recentsLabel = UILabel(frame: CGRect(x: 30, y: 175, width: 150, height: 40))
            recentsLabel.font = UIFont(name: "Karla-Bold", size: 14)
        default:
            recentsLabel = UILabel(frame: CGRect(x: 30, y: 225, width: 150, height: 40))
            recentsLabel.font = UIFont(name: "Karla-Bold", size: 16)
        }
        recentsLabel.text = "Recent activities"
        recentsLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        pageScroll.addSubview(recentsLabel)
        
        
        let recentsView = UICollectionView(frame: CGRect(x: 30, y: 275, width: UIScreen.main.bounds.width - 60, height: 300), collectionViewLayout: UICollectionViewFlowLayout())
        if (UIDevice().type == .iPhone5S || UIDevice().type == .iPhoneSE || UIDevice().type == .iPhone6 || UIDevice().type == .iPhone6S || UIDevice().type == .iPhone7 || UIDevice().type == .iPhone8) {
            recentsView.frame = CGRect(x: 30, y: 225, width: UIScreen.main.bounds.width - 60, height: 300)
            pageScroll.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 550)
        }
        recentsView.backgroundColor = nil
        recentsView.dataSource = self
        recentsView.delegate = self
        recentsView.register(RecentsCollectionViewCell.self, forCellWithReuseIdentifier: "coll")
        pageScroll.addSubview(recentsView)
        
        
//        let favoritesLabel: UILabel!
//        switch UIDevice().type {
//        case .iPhone5S, .iPhoneSE, .iPhone6, .iPhone7, .iPhone8:
//            favoritesLabel = UILabel(frame: CGRect(x: 30, y: 350, width: 150, height: 40))
//            favoritesLabel.font = UIFont(name: "Karla-Bold", size: 14)
//        default:
//            favoritesLabel = UILabel(frame: CGRect(x: 30, y: 400, width: 150, height: 40))
//            favoritesLabel.font = UIFont(name: "Karla-Bold", size: 16)
//        }
//        favoritesLabel.text = "Favorites"
//        favoritesLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
//        pageScroll.addSubview(favoritesLabel)
////        loadFavorites()
//        //favorites collection view height: 140
        
        self.view.addSubview(pageScroll)
    }
    
    @objc func searchAction(sender: UIButton!) {
        self.navigationController?.pushViewController(SearchViewController(), animated: true)
    }

    @objc func reduce(sender: UIButton!) {
        self.navigationController?.pushViewController(ReducingViewController(), animated: true)
        
    }
    
    @objc func reuse(sender: UIButton!) {
        self.navigationController?.pushViewController(ReusingViewController(), animated: true)
    }
    
    @objc func recycle(sender: UIButton!) {
        self.navigationController?.pushViewController(RecyclingViewController(), animated: true)
    }
    
    @objc func foodAction(sender: UIButton!) {
        self.navigationController?.pushViewController(FoodViewController(), animated: true)
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
