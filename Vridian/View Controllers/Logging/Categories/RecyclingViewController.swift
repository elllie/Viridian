//
//  ReducingViewController.swift
//  Vridian
//
//  Created by Eleanor on 2/2/19.
//

import UIKit

class RecyclingViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    let activities = [Activity.a15, Activity.a16, Activity.a17, Activity.a18, Activity.a19, Activity.a20, Activity.a21, Activity.a22]
    let pageType = ["a", "a", nil, "a", "a", nil, nil]
    let howMany = ["How many loads?", "How many loads?", "How many?", "Quantity", "How many bags?", "", "Size (oz)"]
    let tips = [Tips.airDryingGentler, Tips.handWashingGentler, nil, nil, Tips.reusableBagsAvailable, nil, Tips.reusableBottlesMaterial]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return activities.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "coll", for: indexPath) as! CategoryCollectionViewCell
        cell.picture.image = activities[indexPath.row].image
        cell.label.text = activities[indexPath.row].name
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        switch UIDevice().type {
        case .iPhone5, .iPhoneSE:
            return CGSize(width: 95, height: 225)
        default:
            return CGSize(width: 100, height: 200)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        switch UIDevice().type {
        case .iPhoneSE, .iPhone5S, .iPhone6plus, .iPhone6Splus, .iPhone7plus, .iPhone8plus:
            return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        default:
            return UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //let cell = collectionView.cellForItem(at: indexPath)
        if (pageType[indexPath.row] == "a") {
            let detailView = TypeAViewController()
            detailView.titleLabelText = activities[indexPath.row].name
            detailView.iconViewImage = activities[indexPath.row].image
            detailView.howManyLabelText = howMany[indexPath.row]
            detailView.tipLabelText = tips[indexPath.row].map { $0.rawValue }
            self.navigationController?.pushViewController(detailView, animated: true)
//            CurrentActivity.sharedInstance.activity = activities[indexPath.row]
            Activity.CurrentActivity = activities[indexPath.row]
        }
        else {
            print("Couldn't load activity data :(")
            // in future, tell user there was a problem loading the activity data, and ask if they still want to try to log it (knowing that it may be broken)
        }
        print(activities[indexPath.row].name)
    }

    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        let back = UIButton(frame: CGRect(x: 20, y: 50, width: 20, height: 40))
        back.setTitle("<", for: .normal)
        back.titleLabel?.font = UIFont(name: "Karla-Bold", size: 36)
        back.setTitleColor(UIColor(named: "darkTint"), for: .normal)
        back.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        self.view.addSubview(back)
        
        let reducingLabel = UILabel(frame: CGRect(x: 55, y: 50, width: 220, height: 45))
        reducingLabel.text = "Recycling"
        reducingLabel.font = UIFont(name: "Karla-Bold", size: 36)
        reducingLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.view.addSubview(reducingLabel)
        
        let collection = UICollectionView(frame: CGRect(x: 40, y: 100, width: (UIScreen.main.bounds.width - 80), height: UIScreen.main.bounds.height), collectionViewLayout: UICollectionViewFlowLayout())
        collection.contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 150, right: 0.0)
        collection.backgroundColor = nil
        collection.dataSource = self
        collection.delegate = self
        collection.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: "coll")
        
        self.view.addSubview(collection)
    }
    
    @objc func backAction(sender: UIButton!) {
        self.navigationController?.popViewController(animated: true)
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
