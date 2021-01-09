//
//  AppDelegate.swift
//  Tropogo
//
//  Created by NAVEEN on 09/01/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        if #available(iOS 13.0, *) {
        } else {
        }
        window?.makeKeyAndVisible()
        return true
    }

}

