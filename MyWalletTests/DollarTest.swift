//
//  DollarTest.swift
//  MyWallet
//
//  Created by jro on 20/07/16.
//  Copyright © 2016 jro. All rights reserved.
//

import XCTest

class DollarTest: XCTestCase {
    

    func testMultiplication(){
        do{
            let five = Money(withAmount:0, currency: "USD").dollarWithAmount(5) as! Dollar
            let ten = try five.times(2)
            let total = Money(withAmount:0, currency: "USD").dollarWithAmount(10) as! Dollar
            
            XCTAssertEqual(ten as! Dollar, total)
        }catch let error as NSError{
            print("error: \(error)")
        }
        
        
    }
    
    func testEquality(){
        
        do{
            let five = Money(withAmount:0, currency: "USD").dollarWithAmount(5) as! Dollar
            let ten = try five.times(2)
            let total = Money(withAmount:0, currency: "USD").dollarWithAmount(10) as! Dollar
            
            XCTAssertEqual(ten as! Dollar, total)
            
            XCTAssertFalse(total.isEqual(five))
            
            XCTAssertEqual(ten as! Dollar, total)
        }catch let error as NSError{
            print("error: \(error)")
        }
        
        
        
    }
    
    func testHash(){
        
        let var1 = Money(withAmount:0, currency: "USD").dollarWithAmount(2) as! Dollar
        let var2 = Money(withAmount:0, currency: "USD").dollarWithAmount(2) as! Dollar
        
        XCTAssertEqual(var1.hashValue, var2.hashValue, "Equal Objects must have the same hash")
        
    }
    
}
