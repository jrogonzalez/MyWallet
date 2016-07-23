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
    
        let euro = Money(euroWithAmount: 5)
        let total = euro.times(2)
            
        XCTAssertEqual(total, euro.times(2))
        
    }
    
    func testEquality(){
        
        let cinco = Money(euroWithAmount: 5)
        let diez = Money(euroWithAmount: 10)
        let total = cinco.times(2)
        
        XCTAssertEqual(diez, total)
        
        let aa = Money(dollarWithAmount: 2)
        let bb = aa.times(2)
        XCTAssertEqual(Money(dollarWithAmount: 4) , bb, "should be equal")
        
        
    }
    
    func testdifferentCurency(){
        
        let euro = Money(euroWithAmount: 1)
        let dollar = Money(dollarWithAmount: 1)
        
        XCTAssertNotEqual(euro, dollar, "hould not be equal")
        
    }
    
    func testSimpleAddition(){
        let uno = Money(dollarWithAmount: 5)
        let diez = uno.plus(Money(dollarWithAmount: 5))
        
        XCTAssertEqual(diez, Money(dollarWithAmount: 10) , "5$ + 5$ = 10$")
        
    }
    
    
    
    
    func testHash(){
        
        let var1 = Money(euroWithAmount: 2)
        let var2 = Money(euroWithAmount: 2)
        
        XCTAssertEqual(var1.hashValue , var2.hashValue, "Equal Objects must have the same hash")
        
        XCTAssertEqual(Money(withAmount: 1, currency: "USD").hashValue , Money(withAmount: 1, currency: "USD").hashValue, "Equal Objects must have the same hash")
        
    }
    
    func testAmountStorage(){
        let euro = Money(euroWithAmount: 2)
        
        XCTAssertEqual(2, euro.amount, "son iguales")
        
    }

    
    
    func testCurrencies(){
        
        let euro = Money(euroWithAmount: 1)
        XCTAssertEqual("EUR", euro.currency, "The monuey should be Euro")

        
        let dollar = Money(dollarWithAmount: 1)
        XCTAssertEqual("USD", dollar.currency, "The monuey should be Dollar")
    }
    
    func testThatHashISAmout(){
        let money = Money(dollarWithAmount: 1)
        
        XCTAssertEqual(money.hash(), 1, "Hash must be the same amount")
    }
    
    func testDescription(){
        
        let money = Money(dollarWithAmount: 1)
        let des = "<Money: USD 1>"
        
        
        XCTAssertEqual(money.description(), des, "sould be the same description")
    }

}
