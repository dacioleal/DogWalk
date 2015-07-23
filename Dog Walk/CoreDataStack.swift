//
//  CoreDataStack.swift
//  Dog Walk
//
//  Created by Dacio Leal Rodriguez on 22/7/15.
//  Copyright (c) 2015 Razeware. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    let context : NSManagedObjectContext
    let psc : NSPersistentStoreCoordinator
    let model : NSManagedObjectModel!
    let store : NSPersistentStore?
    
    
    init() {
        
        //1 Model
        let bundle = NSBundle.mainBundle()
        let modelURL = bundle.URLForResource("DogWalk", withExtension: "momd")
        model = NSManagedObjectModel(contentsOfURL: modelURL!)
        
        //2 PersistentStoreCoordinator
        psc = NSPersistentStoreCoordinator(managedObjectModel: model)
        
        //3 ManagedObjectContext
        context = NSManagedObjectContext()
        context.persistentStoreCoordinator = psc
        
        //4 PersistentStore
        
        let fileManager = NSFileManager.defaultManager()
        let urls = fileManager.URLsForDirectory(NSSearchPathDirectory.DocumentDirectory, inDomains: NSSearchPathDomainMask.UserDomainMask) as! [NSURL]
        
        let documentsURL = urls[0]
        let storeURL = documentsURL.URLByAppendingPathComponent("DogWalk")
        let options = [NSMigratePersistentStoresAutomaticallyOption:true]
        
        var error : NSError?
        
        store = psc.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: storeURL, options: options, error: &error)
        
        if store == nil {
            println("Error adding persistent store: \(error)")
            abort()
        }
        
    }
}
