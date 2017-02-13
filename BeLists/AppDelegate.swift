//
//  AppDelegate.swift
//  BeLists
//
//  Created by Shuvayan Saha on 07/02/17.
//  Copyright © 2017 MagicMind Technologies Pvt. Ltd. All rights reserved.
//

import UIKit
import Material


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


    
    

    
    
    
    
    
    
    
    
    //////////////////////////////////// Drawer ////////////////////////////

    
        lazy var rootViewController: RootViewController = {
            return UIStoryboard.viewController(identifier: "RootViewController") as! RootViewController
        }()
        
        lazy var leftViewController: LeftViewController = {
            return UIStoryboard.viewController(identifier: "LeftViewController") as! LeftViewController
        }()
        
        lazy var rightViewController: RightViewController = {
            return UIStoryboard.viewController(identifier: "RightViewController") as! RightViewController
        }()
        
        func applicationDidFinishLaunching(_ application: UIApplication) {
            window = UIWindow(frame: Screen.bounds)
            window!.rootViewController = AppNavigationDrawerController(rootViewController: rootViewController,
                                                                       leftViewController: leftViewController,
                                                                       rightViewController: rightViewController)
            window!.makeKeyAndVisible()
        }
    
    //////////////////////////////////// Drawer ////////////////////////////


}




//////////////////////////////////// Drawer ////////////////////////////

extension UIStoryboard {
    class func viewController(identifier: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: identifier)
    }
}

//////////////////////////////////// Drawer ////////////////////////////
