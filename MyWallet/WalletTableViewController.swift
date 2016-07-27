//
//  WalletTableViewController.swift
//  MyWallet
//
//  Created by jro on 24/07/16.
//  Copyright © 2016 jro. All rights reserved.
//

import UIKit

class WalletTableViewController: UITableViewController {
    
    let model : Wallet
    var broker : Broker = Broker()
    
    
    init(withModel model: Wallet?){
        self.model = model!
        super.init(nibName: nil, bundle: nil)
    }
    
    init(withModel model: Wallet?, broker: Broker){
        self.model = model!
        self.broker = broker
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return self.model.sections() + 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let limiteSection = self.model.sections()
        
        if (section < limiteSection){
            return self.model.cont(section) + 1
        }else{
            return 1
        }

        
        
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        // Tipo de celda
        let cellId = "MoneyCell"
        
        // Crear la celda
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId)
        
        if cell == nil{
            // el opcional esta vacio: hay que crear la celda a pelo
            cell = UITableViewCell(style: .Subtitle, reuseIdentifier: cellId)
        }

        
        var sum = 0.0

        let limiteSection = self.model.sections()
       
        if (indexPath.section == limiteSection){            
            // Sincronizar moneda -> celda
            
            do{
                let total = try self.model.reduce("USD", withBroker: self.broker)
                cell?.textLabel?.text = "TOTAL WALLET: \(total.amount) \(total.currency)"
                cell?.backgroundColor = UIColor.greenColor()
            }catch let error as NSError{
                print("Error: \(error)")
            }
            
            
        }else{
            let limite = self.model.cont(indexPath.section)
            // Averiguar de que moneda me estan preguntando
            if (indexPath.row < limite){
                let theMoney = money(forIndexPath: indexPath)
                
                // Sincronizar moneda -> celda
                cell?.textLabel?.text = theMoney.descriptionMoney() as String
            }else{
                
                sum = self.model.sumatorio(indexPath.section)
                // Sincronizar moneda -> celda
                cell?.textLabel?.text = "Subtotal \(self.model.currency(indexPath.section)): \(sum)"
            }
            
        }
        
        return cell!
    }
    
    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        //Cambiamos el color a la celda
        view.tintColor = UIColor.cyanColor()
        
        let header : UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        
        header.textLabel?.textColor = UIColor.blackColor()
        header.textLabel?.textAlignment = NSTextAlignment.Left
        
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let limiteSection = self.model.sections()
        
        if (section < limiteSection){
            return model.currency(section)
        }
        
        return nil
    }
    
    func money(forIndexPath indexPath: NSIndexPath)-> Money{
        return model.money(indexPath.section, atRow: indexPath.row)
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
}
