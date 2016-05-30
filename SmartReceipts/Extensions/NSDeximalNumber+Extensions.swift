//
//  NSDeximalNumber+Extensions.swift
//  SmartReceipts
//
//  Created by Jaanus Siim on 30/05/16.
//  Copyright © 2016 Will Baumann. All rights reserved.
//

import Foundation

extension NSDecimalNumber {
    @nonobjc static let MinusOne = NSDecimalNumber(string: "-1")
    
    func isPositiveAmount() -> Bool {
        return compare(NSDecimalNumber.zero()) == .OrderedDescending
    }
}