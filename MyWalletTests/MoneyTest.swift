//
//  MoneyTest.swift
//  MyWallet
//
//  Created by jro on 20/07/16.
//  Copyright © 2016 jro. All rights reserved.
//

import XCTest

class MoneyTest: XCTestCase {
    
    
    func testSimpleMultiplication(){
    
        let euro = Money(withAmount:0, currency: "EUR").euroWithAmount(5)
        let total = euro.times(2)
            
        XCTAssertEqual(total, euro.times(2))
        
    }
    
    func testEquality(){
        
        let cinco = Money(withAmount:0, currency: "EUR").euroWithAmount(5)
        let diez = Money(withAmount:0, currency: "EUR").euroWithAmount(10)
        let total = cinco.times(2)
        
        XCTAssertEqual(diez, total)
        
        let aa = Money(withAmount: 0, currency: "USD").dollarWithAmount(2)
        let bb = aa.times(2)
        XCTAssertEqual(Money(withAmount: 0, currency: "USD").dollarWithAmount(4) , bb, "should be equal")
        
        
    }
    
    func testdifferentCurency(){
        
        let euro = Money(withAmount: 1, currency: "EUR").euroWithAmount(1)
        let dollar = Money(withAmount: 1, currency: "USD").dollarWithAmount(1)
        
        XCTAssertNotEqual(euro, dollar, "hould not be equal")
        
    }
    
    func testSimpleAddition(){
        let uno = Money(withAmount: 0, currency: "USD").dollarWithAmount(5)
        let diez = uno.plus(Money(withAmount: 0, currency: "USD").dollarWithAmount(5))
        
        XCTAssertEqual(diez, Money(withAmount: 0, currency: "USD").dollarWithAmount(10) , "5$ + 5$ = 10$")
        
    }
    
    
    
    
    func testHash(){
        
        let var1 = Money(withAmount:0, currency: "EUR").euroWithAmount(2)
        let var2 = Money(withAmount:0, currency: "EUR").euroWithAmount(2)
        
        XCTAssertEqual(var1.hashValue , var2.hashValue, "Equal Objects must have the same hash")
        
        XCTAssertEqual(Money(withAmount: 1, currency: "USD").hashValue , Money(withAmount: 1, currency: "USD").hashValue, "Equal Objects must have the same hash")
        
    }
    
    func testAmountStorage(){
        let euro = Money(withAmount:0, currency: "EUR").euroWithAmount(2)
        
        XCTAssertEqual(2, euro.amount, "son iguales")
        
    }

    
    
    func testCurrencies(){
        
        let euro = Money(withAmount: 0, currency: "EUR").euroWithAmount(1) as! Money
        XCTAssertEqual("EUR", euro.currency, "The monuey should be Euro")

        
        let dollar = Money(withAmount: 0, currency: "USD").dollarWithAmount(1) as! Money
        XCTAssertEqual("USD", dollar.currency, "The monuey should be Dollar")
    }

}
