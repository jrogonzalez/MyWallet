//
//  MoneyTest.swift
//  MyWallet
//
//  Created by jro on 20/07/16.
//  Copyright © 2016 jro. All rights reserved.
//

import XCTest

class MoneyTest: XCTestCase {
    
    func testCurrencies(){
        
        let euro = Money(withAmount: 0, currency: "EUR").euroWithAmount(1) as! Euro
        XCTAssertEqual("EUR", euro.currency, "The monuey should be Euro")

        
        let dollar = Money(withAmount: 0, currency: "USD").dollarWithAmount(1) as! Dollar
        XCTAssertEqual("USD", dollar.currency, "The monuey should be Dollar")
    }

}
