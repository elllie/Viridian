//
//  CollectTop10.swift
//  Vridian
//
//  Created by Eleanor on 3/2/19.
//

import Foundation
import CoreData

extension Top10 {
    
    func collect() {
        moc = appDelegate?.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<Diary>(entityName: "Diary")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "logged", ascending: false)]
        fetchRequest.fetchLimit = 100 // one day this will evaluate to the user's average count per week.
        
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
    
}
