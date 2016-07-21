//
//  Dollar.swift
//  MyWallet
//
//  Created by jro on 20/07/16.
//  Copyright © 2016 jro. All rights reserved.
//

import Foundation

class Dollar: Money{
    
    
//    func multiplier(times: Int){
//        self.amount = self.amount * times
//    }
    
//    override func times(multiplier: NSInteger) ->Dollar{
//        
//        let amount =  Dollar(withAmount: self.amount * multiplier)
//        return amount
//        
//    }

    
}

extension Dollar{
    
    func isEqual(dollar: Dollar) ->Bool{
        
        return self.amount == dollar.amount
    }
}