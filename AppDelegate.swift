//
//  AppDelegate.swift
//  Schwifty
//
//  Created by Engkit Satia Riswara on 01/02/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let cinemaHomeViewController: CinemaHomeViewController = {
            
            let homeController = CinemaHomeViewController()
            
            return homeController
        }()
        
        let nav = UINavigationController(rootViewController: cinemaHomeViewController)
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        self.window?.rootViewController = nav
        
        self.window?.makeKeyAndVisible()
        
        return true
    }


}

