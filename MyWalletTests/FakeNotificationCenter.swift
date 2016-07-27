//
//  FakeNotificationCenter.swift
//  MyWallet
//
//  Created by jro on 24/07/16.
//  Copyright © 2016 jro. All rights reserved.
//

import UIKit

class FakeNotificationCenter: NSNotificationCenter {
    
    var observers : NSMutableDictionary = NSMutableDictionary()
    
    
    override func addObserver(observer: AnyObject, selector: Selector, name: String?, object: AnyObject?){
        
        self.observers.setObject(observer, forKey: name!)
    }
    
    func obtainObservers()-> NSMutableDictionary{
        return self.observers
    }
    

}
