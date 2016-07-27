//
//  Wallet.swift
//  MyWallet
//
//  Created by jro on 23/07/16.
//  Copyright © 2016 jro. All rights reserved.
//

import Foundation

class Wallet: Money{
    
    
    //MARK: - Utility types
    typealias MoneyArray         = [Money]
    typealias MoneyDictionary    = [String: MoneyArray]
    
    //MARK: - Properties
    var moneyList : MoneyDictionary = MoneyDictionary()
    
    private var count : Int
    
    override init(withAmount: NSInteger, currency: String){
        let money = Money(withAmount: withAmount, currency: currency)
        
        self.moneyList[money.currency as String] =  MoneyArray()
        self.moneyList[money.currency as String]?.append(money)
        
        self.count = 0
        super.init(withAmount: withAmount, currency: currency)
    }

    func cont(section: Int)-> Int{
        let sec = currency(section)
        return self.moneyList[sec]!.count
    }
    
    func sections() -> Int{
        return moneyList.count
        
    }
    
    override func times(multiplier: NSInteger) ->Money{
        var newMoneys : MoneyDictionary = MoneyDictionary()
        
        for (_, value) in self.moneyList{
            for each2 in value{
                
                if newMoneys[each2.currency as String] != nil{
                    let newMoney = each2.times(multiplier)
                    newMoneys[each2.currency as String]?.append(newMoney)
                }else{
                    
                    newMoneys[each2.currency as String] =  MoneyArray()
                    let newMoney = each2.times(multiplier)
                    newMoneys[each2.currency as String]?.append(newMoney)
                }                
            }
            
        }
        self.moneyList = newMoneys
        return self
        
        
    }
    
    override func plus(money: Money) -> Money{
        
        if self.moneyList[money.currency as String] != nil{
            self.moneyList[money.currency as String]?.append(money)
        }else{
            
            self.moneyList[money.currency as String] =  MoneyArray()
            self.moneyList[money.currency as String]?.append(money)
        }
        
        return self
    }
    
    
    override func reduce(toCurrency: String, withBroker: Broker) throws -> Money{
        
        //        var result : Wallet = Wallet(withAmount: 10, currency: "EUR")
        
        var newAmount = 0.0
        
        
        for (_, value) in self.moneyList{
            for each2 in value{
                let auxMoney = try each2.reduce(toCurrency, withBroker: withBroker)
                
                newAmount += Double(auxMoney.amount)            }
        }
        
        return Money(withAmount: Int(newAmount), currency: toCurrency)
    }
    
    func suscribeToMemoryWarning(nc: NSNotificationCenter){
        nc.addObserver(self, selector: #selector(dumpToDisk) , name: "UIApplicationDidReceiveMemoryWarningNotification", object: nil)
        
    }
    
    @objc func dumpToDisk(){
        //guarda en disco cuando la cosa se ponga fea
        
    }
    
    
    func money(forSection: Int, atRow: Int) -> Money{
        let sect = currency(forSection)
        
        let mon = self.moneyList[sect]![atRow]
        
        return mon
        
        
    }
    
    func currency(forSection: Int) -> String{
        let arr = Array(self.moneyList.keys)
        return arr[forSection]
        
    }
    
    func sumatorio(forSection: Int) -> Double{
        
        let sect = currency(forSection)
        var sum = 0.0
        
        for each in self.moneyList[sect]!{
            sum += Double(each.amount)
        }
        
        return sum
    }
    
    
    
    
}
