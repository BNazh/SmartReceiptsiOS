//
//  MigrationServiceTest.swift
//  SmartReceiptsTests
//
//  Created by Bogdan Evsenev on 09/01/2018.
//  Copyright © 2018 Will Baumann. All rights reserved.
//

@testable import SmartReceipts
import XCTest

class MigrationServiceTest: XCTestCase {
    var migrationService = MigrationServiceTestable()
    
    override func setUp() {
        super.setUp()
        UserDefaults.standard.set(0, forKey: "migration_version_key")
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testMigratedOnceIlligalTripNames() {
        migrationService.migrate()
        migrationService.migrate()
        XCTAssertEqual(migrationService.migrateIlligalTripNamesCalls, 1)
    }
    
    func testMigratedOnceCustomOrderIds() {
        migrationService.migrate()
        migrationService.migrate()
        XCTAssertEqual(migrationService.migrateCustomOrderIdsCalls, 1)
    }
    
}
