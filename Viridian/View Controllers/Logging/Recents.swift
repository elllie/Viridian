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
