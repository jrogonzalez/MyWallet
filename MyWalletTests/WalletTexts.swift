//
//  WalletTexts.swift
//  MyWallet
//
//  Created by jro on 23/07/16.
//  Copyright © 2016 jro. All rights reserved.
//

import XCTest

class WalletTexts: XCTestCase {

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


    // 40€ + 20$ = 100$ 2:1
    func testAdditionWithReduction(){
        
        do{
            let broker = Broker()
            broker.addRate(2, fromCurrency: "EUR", toCurrecy: "USD")
            let dollars = Money(dollarWithAmount: 20)
            
            let wallet = Wallet(withAmount: 40, currency:"EUR")
            wallet.plus(dollars)
            
            let reduce = try broker.reduce(wallet, toCurrency: "USD")
            
            XCTAssertEqual(reduce, Money(dollarWithAmount: 100), "should be the same 40€ + 20$ = 100$ 2:1 ")
            
        }catch let error as NSError{
            print("error \(error)")
            
        }
        
        
    }

}
