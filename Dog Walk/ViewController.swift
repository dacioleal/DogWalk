//
//  ViewController.swift
//  Dog Walk
//
//  Created by Dacio Leal on 7/22/15.
//  Copyright (c) 2015 Dacio Leal. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    var currentDog : Dog!
    var managedContext : NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.registerClass(UITableViewCell.self,
            forCellReuseIdentifier: "Cell")
        
        //Insert Dog entity
        let dogEntity = NSEntityDescription.entityForName("Dog", inManagedObjectContext: managedContext)
        
        let dog = Dog(entity: dogEntity!, insertIntoManagedObjectContext: managedContext)
        
        let dogName = "Fido"
        let dogFetch = NSFetchRequest(entityName: "Dog")
        dogFetch.predicate = NSPredicate(format: "name == %@", dogName)
        
        var error : NSError?
        
        let result = managedContext.executeFetchRequest(dogFetch, error: &error)
        
        if let dogs = result {
            
            if dogs.count == 0 {
                
                currentDog = Dog(entity: dogEntity!, insertIntoManagedObjectContext: managedContext)
                currentDog.name = dogName
                
                if !managedContext.save(&error) {
                    println("Could not save: \(error), \(error!.userInfo)")
                }
                
            }
        } else {
            println("Could not fetch")
        }
    }
    
    func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            
            var numRows = 0
            
            if let dog = currentDog as Dog? {
                numRows = dog.walks.count
            }
            
            return numRows
    }
    
    func tableView(tableView: UITableView,
        titleForHeaderInSection section: Int) -> String? {
            return "List of Walks";
    }
    
    func tableView(tableView: UITableView,
        cellForRowAtIndexPath
        indexPath: NSIndexPath) -> UITableViewCell {
            
            let cell =
            tableView.dequeueReusableCellWithIdentifier("Cell",
                forIndexPath: indexPath) as! UITableViewCell
            
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateStyle = .ShortStyle
            dateFormatter.timeStyle = .MediumStyle
            
            let walk =  currentDog.walks[indexPath.row] as? Walk
            cell.textLabel!.text = dateFormatter.stringFromDate(walk!.date)
            
            return cell
    }
    
    @IBAction func add(sender: AnyObject) {
        //walks.append(NSDate())
        tableView.reloadData()
    }
    
}











