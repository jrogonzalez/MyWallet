//
//  EuroTests.swift
//  MyWallet
//
//  Created by jro on 18/07/16.
//  Copyright © 2016 jro. All rights reserved.
//

import XCTest

class EuroTests: XCTestCase {
    
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
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testSimpleMultiplication(){
        do{
            let euro = Money(withAmount:0, currency: "EUR").euroWithAmount(5) as! Euro
            let total = try euro.times(2)
            
            XCTAssertEqual(total as! Euro, try euro.times(2) as! Euro)
        }catch{
            
        }
        
    }
    
    func testEquality(){
        
        do{
            let cinco = Money(withAmount:0, currency: "EUR").euroWithAmount(5) as! Euro
            let diez = Money(withAmount:0, currency: "EUR").euroWithAmount(10) as! Euro
            let total = try cinco.times(2)
            
            XCTAssertEqual(diez, total as! Euro)

        }catch let error as NSError{
            print("error \(error)")
        }
        
           }
    
    
    
    
    func testHash(){
        
        let var1 = Money(withAmount:0, currency: "EUR").euroWithAmount(2) as! Euro
        let var2 = Money(withAmount:0, currency: "EUR").euroWithAmount(2) as! Euro
        
        XCTAssertEqual(var1.hashValue , var2.hashValue, "Equal Objects must have the same hash")
        
    }
    
    func testAmountStorage(){
        let euro = Money(withAmount:0, currency: "EUR").euroWithAmount(2) as! Euro
        
        XCTAssertEqual(2, euro.amount, "son iguales")
        
    }
    
    
    
}
