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
    
    func multiplier(times: Int){
        self.amount = self.amount * times
    }
    
    func times(multiplier: NSInteger) ->Money{

            let money =  Money(withAmount: self.amount * multiplier, currency: self.currency)
            return money
        
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
    
    func hash() -> NSInteger{
        
        return self.amount

    }
    
    //MARK: overwritten
    func description() -> NSString{
        let nombre = String(self.dynamicType)
        let aux = String(format: "<\(nombre): %@ %d>", self.currency,  self.amount)
        return aux
    }
    
    func reduce(toCurrency: String, withBroker: Broker) throws -> Money{
        
        var result : Money
        //comprobamos que divisa de origen y de destino son las mismas
        if self.currency.isEqualToString(toCurrency){
            return self
        }
        
        guard let rate = withBroker.rates[withBroker.keyFromCurrency(self.currency, toCurrency: toCurrency)] else{
            throw Errors.rateEmpty
        }
        
        if rate == 0 {
            throw Errors.rateEmpty
        }
        
        let newAmount = Double(self.amount) * rate
        result = Money(withAmount: Int(newAmount), currency: toCurrency)
        return result
    }    

}




func ==(lhs: Money, rhs: Money) -> Bool{
    return lhs.currency == rhs.currency && lhs.amount == rhs.amount
}


protocol MoneyProtocol {
    
    init(withAmount: NSInteger, currency: NSString)
    func times(multiplier: NSInteger) ->AnyObject
    func plus(money: Money) -> AnyObject
    
}

