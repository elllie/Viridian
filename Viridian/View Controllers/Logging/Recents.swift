//
//  RecentsFavorites.swift
//  Vridian
//
//  Created by Eleanor on 1/30/19.
//

import UIKit
import CoreData

extension LoggingViewController {

    func pullRecents() {
        moc = appDelegate?.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<Diary>(entityName: "Diary")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "logged", ascending: false)]
        fetchRequest.fetchLimit = 6 // one day this will evaluate to the user's average count per week.
        
        persistentContainer.loadPersistentStores { (persistentStoreDescription, error) in
            if let error = error {
                print("Unable to Load Persistent Store")
                print("\(error), \(error.localizedDescription)")
                
            } else {
                do {
                    try self.entries = self.moc.fetch(fetchRequest)
                } catch {
                    let fetchError = error as NSError
                    print("Unable to Perform Fetch Request")
                    print("\(fetchError), \(fetchError.localizedDescription)")
                }
            }
        }
    }
    
    func displayRecents() {
        pullRecents()
        let ids = entries.map({$0.actID}) // int32

        for activity in Activity.allActivities {
            if ids.contains(Int32(activity.id)) {
                activities.append(activity)
            }
        }
        print(activities.map({$0.name}))
        
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
            print(activities[indexPath.row].name)
        }
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
