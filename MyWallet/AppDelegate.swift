//
//  AppDelegate.swift
//  MyWallet
//
//  Created by jro on 18/07/16.
//  Copyright © 2016 jro. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        // crear una window
        window = UIWindow(frame:UIScreen.mainScreen().bounds)
        let broker = Broker()
        broker.addRate(2, fromCurrency: "USD", toCurrecy: "EUR")
        let model = Wallet(withAmount: 10, currency: "EUR")
        let money = Money(dollarWithAmount: 50)
        model.times(2)
        
        model.plus(money)
        let euro = Money(euroWithAmount: 16)
        model.plus(euro)
        let vC = WalletTableViewController(withModel: model, broker: broker)
        let nav = UINavigationController(rootViewController: vC)
        
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

