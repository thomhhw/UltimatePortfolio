//
//  BaseTestCase.swift
//  BaseTestCase
//
//  Created by Thom Pheijffer on 01/02/2021.
//

import CoreData
import XCTest
@testable import UltimatePortfolio

class BaseTestCase: XCTestCase {
    var dataController: DataController!
    var managedObjectContext: NSManagedObjectContext!

    override func setUpWithError() throws {
        dataController = DataController(inMemory: true)
        managedObjectContext = dataController.container.viewContext
    }
}
