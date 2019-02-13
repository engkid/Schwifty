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
        
        let cinemaVc = self.setupDependencies()
        
        let nav = UINavigationController(rootViewController: cinemaVc)
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        self.window?.rootViewController = nav
        
        self.window?.makeKeyAndVisible()
        
        return true
    }
    
    
    func setupDependencies() -> CinemaHomeViewController {
        
        //MARK: construct homeview viper components with dependency injection
//        let cinemaHomeViewController: CinemaHomeViewController = {
//            
//            let interactor: ICinemaHomeInteractor = CinemaHomeInteractor()
//            
//            let cinemaView: ICinemaHomeView = CinemaHomeViewController()
//            
//            let wireframe: ICinemaHomeWireframe = CinemaHomeWireframe(view: cinemaView)
//            
//            let presenter: ICinemaHomePresenter = CinemaHomePresenter(interactor: interactor, view: cinemaView, wireframe: wireframe)
//            
//            cinemaView.presenter = presenter
//            
//            wireframe.presenter = presenter
//            
//            return cinemaView as! CinemaHomeViewController
//        }()
        
        let cinemaHome: ICinemaHomeView = CinemaHomeViewController()
        
        let cinemaWireframe: ICinemaHomeWireframe = CinemaHomeWireframe(view: cinemaHome)
        
        let cinemaInteractor: ICinemaHomeInteractor = CinemaHomeInteractor()
        
        let presenter: ICinemaHomePresenter = CinemaHomePresenter(interactor: cinemaInteractor, view: cinemaHome, wireframe: cinemaWireframe)
        
        cinemaHome.presenter = presenter
        
        return cinemaHome as! CinemaHomeViewController
        
    }


}

