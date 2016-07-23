//
//  Broker.swift
//  MyWallet
//
//  Created by jro on 21/07/16.
//  Copyright © 2016 jro. All rights reserved.
//

import Foundation

class Broker{
    
    var rates : [NSString: Double]
    
    init(){
        self.rates = [NSString: Double]()
    }
    
    func reduce(money: Money  , toCurrency: String) throws -> Money{
        
        var result : Money
        //comprobamos que divisa de origen y de destino son las mismas
        if money.currency.isEqualToString(toCurrency){
            return money
        }
        
        guard let rate = self.rates[keyFromCurrency(money.currency, toCurrency: toCurrency)] else{
            throw Errors.rateEmpty
        }
        
        if rate == 0 {
            throw Errors.rateEmpty
        }
       
        let newAmount = Double(money.amount) * rate
        result = Money(withAmount: Int(newAmount), currency: toCurrency)
        return result
    }
    
    func reduce(money: Wallet , toCurrency: String) throws -> Money{
        
//        var result : Wallet = Wallet(withAmount: 10, currency: "EUR")
        
        var newAmount = 0.0
        
        for each in money.moneys{
            
            let auxMoney = try self.reduce(each, toCurrency: toCurrency)
            
            newAmount += Double(auxMoney.amount)
        }
        
        
        return Money(withAmount: Int(newAmount), currency: toCurrency)
    }

    
    func addRate(rate: Double , fromCurrency: NSString, toCurrecy: NSString){
        self.rates[keyFromCurrency(fromCurrency, toCurrency: toCurrecy)] = rate
        self.rates[keyFromCurrency(toCurrecy, toCurrency: fromCurrency)] = 1/rate
    }
    
    //MARK: Utils
    func keyFromCurrency(fromCurrency: NSString, toCurrency: NSString) -> NSString{
        
        let sal = NSString.localizedStringWithFormat("%@-%@", fromCurrency, toCurrency)
        return sal
        
    }
    

    
}