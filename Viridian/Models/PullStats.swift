//
//  PullStats.swift
//  Vridian
//
//  Created by Eleanor on 2/24/19.
//

import Foundation
import CoreData
import UIKit

extension Statistics {
    
    func retrieve() {
        moc = appDelegate?.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<Diary>(entityName: "Diary")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "logged", ascending: false)]

//        persistentContainer.loadPersistentStores { (persistentStoreDescription, error) in
//            if let error = error {
//                print("Unable to Load Persistent Store")
//                print("\(error), \(error.localizedDescription)")
//
//            } else {
                do {
                    try self.entries = self.moc.fetch(fetchRequest)
                } catch {
                    let fetchError = error as NSError
                    print("Unable to Perform Fetch Request")
                    print("\(fetchError), \(fetchError.localizedDescription)")
                }
            }
    }
