//
//  Money.swift
//  MyWallet
//
//  Created by jro on 20/07/16.
//  Copyright © 2016 jro. All rights reserved.
//

import Foundation

class Money: Equatable, Hashable{

    var amount: NSInteger
    var currency: NSString
    
    init(withAmount: NSInteger, currency: NSString){
        self.amount =  withAmount
        self.currency = currency
    }
    
//    func multiplier(times: Int){
//        self.amount = self.amount * times
//    }
    
    func times(multiplier: NSInteger) throws ->AnyObject{

        if (self is Euro){
            let money =  Euro(withAmount: self.amount * multiplier, currency: self.currency)
            return money
        }else if (self is Dollar){
            let money =  Dollar(withAmount: self.amount * multiplier, currency: self.currency)
            return money
        }else{
            let money =  Money(withAmount: self.amount * multiplier, currency: self.currency)
            return money
        }
        
    }

    
    func euroWithAmount(amount: NSInteger) -> AnyObject{
        return Euro(withAmount: amount, currency: self.currency)
        
    }
    
    func dollarWithAmount(amount: NSInteger) -> AnyObject{
        return Dollar(withAmount: amount, currency: self.currency)
    }
    
    var hashValue: Int {
        get{
            return self.amount
        }
    }
    
    

}

//MARK: overwritten
func description() -> NSString{
    
    return NSString(format: "<%@ %ld")
}

func hash() -> NSString{
    
    return NSString(format: "<%@ %ld")
}

func ==(lhs: Money, rhs: Money) -> Bool{
    if (lhs is Euro && rhs is Euro){
        let alhs = lhs as! Euro
        let arhs = rhs as! Euro
        return alhs.amount == arhs.amount
    }else if(lhs is Dollar && rhs is Dollar){
        let alhs = lhs as! Dollar
        let arhs = rhs as! Dollar
        return alhs.amount == arhs.amount
    }
    return lhs.amount == rhs.amount
}