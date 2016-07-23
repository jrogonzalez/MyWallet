//
//  Wallet.swift
//  MyWallet
//
//  Created by jro on 23/07/16.
//  Copyright © 2016 jro. All rights reserved.
//

import Foundation

class Wallet: NSObject, MoneyProtocol{
    
    var moneys : [Money] = []
    
    required init(withAmount: NSInteger, currency: NSString){
        let money = Money(withAmount: withAmount, currency: currency)
        self.moneys.append(money)
    }
    
    func times(multiplier: NSInteger) ->AnyObject{
        var newMoneys : [Money] = []
        
        for each in self.moneys{
            let newMoney = each.times(multiplier)
            newMoneys.append(newMoney)
        }
        self.moneys = newMoneys
        return self
        
        
    }
    
    func plus(money: Money) -> AnyObject{
        self.moneys.append(money)
        return self
    }
    
    
}
