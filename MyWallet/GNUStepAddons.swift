//
//  GNUStepAddons.swift
//  MyWallet
//
//  Created by jro on 20/07/16.
//  Copyright © 2016 jro. All rights reserved.
//

import UIKit

class GNUStepAddons: NSObject {
    
    func subclassResponsability(aSEL: Selector){
//        let prefix = class_isMetaClass(object_getClass(self)) ? "+" : "-"
        
//        let excep = NSException(name: NSInvalidArgumentException, reason: "should be overwritten by its subclass", userInfo: [NSStringFromClass(object_getClass(self)): self])
        
        NSException.raise("NSInvalidArgumentException", format:"%@%c%@ should be overwritten by its subclass ", arguments:getVaList([NSStringFromSelector(aSEL)]))
        
        
    }

}
