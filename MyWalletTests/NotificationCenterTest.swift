//
//  NotificationCenterTest.swift
//  MyWallet
//
//  Created by jro on 24/07/16.
//  Copyright © 2016 jro. All rights reserved.
//

import XCTest

class NotificationCenterTest: XCTestCase {
    
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
    
    func testthatsubscribesToMemoryWarning(){
        
        let fake = FakeNotificationCenter()
        
        let w = Wallet(withAmount: 1, currency: "USD")
        w.suscribeToMemoryWarning(fake)
        
        let obs = fake.obtainObservers()
        let observer = obs.objectForKey(UIApplicationDidReceiveMemoryWarningNotification) as! Wallet
        
        XCTAssertEqual(observer, w, "Fat Object must suscribe to UIApplicationDidReceiveMemoryWarningNotification")
        
    }
    
}
