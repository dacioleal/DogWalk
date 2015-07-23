//
//  AppDelegate.swift
//  Dog Walk
//
//  Created by Dacio Leal on 7/22/15.
//  Copyright (c) 2015 Dacio Leal. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    lazy var coreDataStack = CoreDataStack()
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        let navigationController = self.window!.rootViewController as! UINavigationController
        
        let viewController = navigationController.topViewController as! ViewController
        
        viewController.managedContext = coreDataStack.context
        
        return true
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        coreDataStack.saveContext()
    }
    
    func applicationWillTerminate(application: UIApplication) {
        coreDataStack.saveContext()
    }
    
}

