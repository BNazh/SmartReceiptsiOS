//
//  ReceiptColumnPriceTests.swift
//  SmartReceipts
//
//  Created by Jaanus Siim on 30/05/16.
//  Copyright © 2016 Will Baumann. All rights reserved.
//

import XCTest
@testable import SmartReceipts

class ReceiptColumnPriceTests: XCTestCase {
    private let column = ReceiptColumnPrice()
    private var receipt: WBReceipt!
    
    override func setUp() {
        super.setUp()

        receipt = WBReceipt()
        receipt.setPrice(NSDecimalNumber(string: "12"), currency: "USD")
    }
    
    func testCSVExport() {
        XCTAssertEqual("12.00", column.valueFromReceipt(receipt, forCSV: true))
    }
    
    func testPDFExport() {
        XCTAssertEqual("$12.00", column.valueFromReceipt(receipt, forCSV: false))
    }
    
    func testOtherCurrency() {
        receipt.setPrice(NSDecimalNumber(string: "8"), currency: "EUR")
        XCTAssertEqual("€8.00", column.valueFromReceipt(receipt, forCSV: false))
    }
}
