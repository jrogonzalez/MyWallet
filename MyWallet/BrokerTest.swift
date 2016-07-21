//
//  BrokerTest.swift
//  MyWallet
//
//  Created by jro on 21/07/16.
//  Copyright © 2016 jro. All rights reserved.
//

import XCTest

class BrokerTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }


    func testSimpleReduction(){
        
        let broker = Broker()
//        let euro = Money(euroWithAmount: 10)
        let sum = Money(dollarWithAmount: 5).plus(Money(dollarWithAmount: 5))
        
        let reduce = broker.reduce(sum, toCurrency: "USD")
        
        XCTAssertEqual(sum, reduce, "Conversion to the same currency should be a NCP")
        
    }

}
