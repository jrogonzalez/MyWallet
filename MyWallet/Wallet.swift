//
//  Wallet.swift
//  MyWallet
//
//  Created by jro on 23/07/16.
//  Copyright © 2016 jro. All rights reserved.
//

import Foundation

class Wallet: Money{
    
    var moneys : [Money] = []
    private var count : Int
    
    override init(withAmount: NSInteger, currency: NSString){
        let money = Money(withAmount: withAmount, currency: currency)
        self.moneys.append(money)
        self.count = 0
        super.init(withAmount: withAmount, currency: currency)
    }

    func cont()-> Int{
        return self.moneys.count
    }
    
    override func times(multiplier: NSInteger) ->Money{
        var newMoneys : [Money] = []
        
        for each in self.moneys{
            let newMoney = each.times(multiplier)
            newMoneys.append(newMoney)
        }
        self.moneys = newMoneys
        return self
        
        
    }
    
    override func plus(money: Money) -> Money{
        self.moneys.append(money)
        return self
    }
    
    
    override func reduce(toCurrency: String, withBroker: Broker) throws -> Money{
        
        //        var result : Wallet = Wallet(withAmount: 10, currency: "EUR")
        
        var newAmount = 0.0
        
        for each in self.moneys{
            
            let auxMoney = try each.reduce(toCurrency, withBroker: withBroker)
            
            newAmount += Double(auxMoney.amount)
        }
        
        
        return Money(withAmount: Int(newAmount), currency: toCurrency)
    }
    
    
}
