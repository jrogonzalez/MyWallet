//
//  SimpleViewController.swift
//  MyWallet
//
//  Created by jro on 24/07/16.
//  Copyright © 2016 jro. All rights reserved.
//

import UIKit

class SimpleViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    @IBAction func displayText(sender: AnyObject) {
        
        let btn = sender as! UIButton
        self.displayLabel.text = btn.titleLabel?.text
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
