//
//  ControllersTests.swift
//  MyWallet
//
//  Created by jro on 24/07/16.
//  Copyright © 2016 jro. All rights reserved.
//

import XCTest

class ControllersTests: XCTestCase {
    
    var simpleVC : SimpleViewController = SimpleViewController(nibName: nil, bundle: nil)
    var button : UIButton  = UIButton(type: UIButtonType.System)
    var label : UILabel = UILabel(frame: CGRectZero)
    
    var wallet = Wallet(withAmount: 10, currency: "EUR")
    var walletVC : WalletTableViewController?
    

    
    override func setUp() {
        super.setUp()
        // Creamos el entorno de laboratorio
        button.titleForState(UIControlState.Normal)
        simpleVC.displayLabel = label
        wallet.plus(Money(dollarWithAmount: 10))
        walletVC = WalletTableViewController(withModel: wallet)
    
        
    }
    
    override func tearDown() {
        // Destruimos el entorno de laboratorio
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testThatTextOnLabelisEqualToTextOnButton(){
        
        
        //mandamos el mensaje
        self.simpleVC.displayText(self.button)
        
        // Comprobamos que la etiqueta y el button tienen el mismo texto
        XCTAssertEqual(self.button.titleLabel!.text, label.text, "Button and label should be equal")
        
    }
    
    func testThatTableHasOneSection(){
        
        let table = UITableView()
        let sections = self.walletVC!.numberOfSectionsInTableView(table)
        
        XCTAssertEqual(sections, 3, "Table and Wallet Has the same number of sections")
    }
    
    func testThatNumberOfCellIsNumberOfMoneyPlusOne(){
        
        let a = self.wallet.cont(0) + 1
        let b = self.walletVC!.tableView.numberOfRowsInSection(0)
        XCTAssertEqual(a, b, "number of cells is number of rows plus 1 (the total)")
        
    }
}
