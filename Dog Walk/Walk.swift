//
//  Walk.swift
//  Dog Walk
//
//  Created by Dacio Leal Rodriguez on 23/7/15.
//  Copyright (c) 2015 Razeware. All rights reserved.
//

import Foundation
import CoreData

class Walk: NSManagedObject {

    @NSManaged var date: NSDate
    @NSManaged var dog: NSManagedObject

}
