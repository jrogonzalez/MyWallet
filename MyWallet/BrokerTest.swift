//
//  BrokerTest.swift
//  MyWallet
//
//  Created by jro on 21/07/16.
//  Copyright © 2016 jro. All rights reserved.
//

import XCTest

class BrokerTest: XCTestCase {
    
    var emptyBroker : Broker = Broker();
    var oneDollar : Money = Money(dollarWithAmount: 1)

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.emptyBroker = Broker()
        oneDollar = Money(dollarWithAmount: 1)
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
        do{
            //        let euro = Money(euroWithAmount: 10)
            let sum = Money(dollarWithAmount: 5).plus(Money(dollarWithAmount: 5))
            
            let reduce = try self.emptyBroker.reduce(sum, toCurrency: "USD")
            
            XCTAssertEqual(sum, reduce, "Conversion to the same currency should be a NCP")
        }catch let error as NSError{
            print("error \(error)")
        }

        
    }
    
    // test 10$ = 5€ 1:2
    func testReduction(){
        
        do{
            self.emptyBroker.addRate(2, fromCurrency: "EUR", toCurrecy: "USD")
            
            let dollar = Money(dollarWithAmount: 10)
            let euro = Money(euroWithAmount: 5)
            
            let converted = try self.emptyBroker.reduce(dollar, toCurrency: "EUR")
            XCTAssertEqual(converted, euro, "10$ == 5€ 1:2")

        }catch let error as NSError{
            print("error \(error)")
        }
        
        
    }
    
    func testThatKnowRateRaisesException(){
     
        XCTAssertThrowsError(try self.emptyBroker.reduce(oneDollar, toCurrency: "GBP"), "No rates should couse exception")
        
    }
    
    func testThatNilconversionDoesNotChangeMoney(){

         XCTAssertEqual(self.oneDollar, try self.emptyBroker.reduce(oneDollar, toCurrency: "USD"), "A nil conversion should have no effect")
        
    }

}
