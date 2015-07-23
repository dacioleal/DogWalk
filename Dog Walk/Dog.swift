//
//  Dog.swift
//  Dog Walk
//
//  Created by Dacio Leal Rodriguez on 23/7/15.
//  Copyright (c) 2015 Razeware. All rights reserved.
//

import Foundation
import CoreData

class Dog: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var walks: NSOrderedSet

}
