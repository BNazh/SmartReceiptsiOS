//
//  ReceiptColumnTax.swift
//  SmartReceipts
//
//  Created by Jaanus Siim on 30/05/16.
//  Copyright © 2016 Will Baumann. All rights reserved.
//

import Foundation

class ReceiptColumnTax: ReceiptColumn {
    override func value(from receipt: WBReceipt, forCSV: Bool) -> String {
        return receipt.taxAsString()
    }
    
    override func value(forFooter rows: [Any]!, forCSV: Bool) -> String! {
       let total = PricesCollection()
        for rec in rows as! [WBReceipt] {
            total.addPrice(rec.tax())
        }
        return total.amountAsString()
    }
}
