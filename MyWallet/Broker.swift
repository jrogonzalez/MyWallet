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
    
    func reduce<T: Money>(money: T, toCurrency: String) throws -> Money{
        
        do{
            
            return try money.reduce(toCurrency, withBroker: self)
            
        }catch let error as NSError{
            print("error \(error)")
            throw Errors.reduceError
            
        }
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