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
    
    init(euroWithAmount: NSInteger){
        self.amount =  euroWithAmount
        self.currency = "EUR"
    }
    
    init(dollarWithAmount: NSInteger){
        self.amount =  dollarWithAmount
        self.currency = "USD"
    }
    
//    func multiplier(times: Int){
//        self.amount = self.amount * times
//    }
    
    func times(multiplier: NSInteger) ->Money{

            let money =  Money(withAmount: self.amount * multiplier, currency: self.currency)
            return money
        
    }

    
    func euroWithAmount(amount: NSInteger) -> Money{
        return Money(withAmount: amount, currency: "EUR")
        
    }
    
    func dollarWithAmount(amount: NSInteger) -> Money{
        return Money(withAmount: amount, currency: "USD")
    }
    
    func plus(money: Money) -> Money{
        let total = self.amount + money.amount
        return Money(withAmount: total, currency: self.currency)
        
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
    return lhs.currency == rhs.currency && lhs.amount == rhs.amount
}