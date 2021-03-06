//
//  UIViewController+AlertControllerExtension.swift
//  Schwifty
//
//  Created by Engkit Satia Riswara on 18/02/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import UIKit
import Foundation

enum TransitionMethod {
    
    case push
    case present
    
}

extension UIViewController {
    
    func showAlertWith(title: String, message: String) {
        
        let alert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let alertButton: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
        alert.addAction(alertButton)
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func navigateFrom(_ sourceViewController: UIViewController, toNextViewController: UIViewController, transition: TransitionMethod, animated: Bool, completion: (() -> Void)?) {
        
        switch transition {
            
        case .push:
            
            if (self.checkPresentedViewController(viewController: sourceViewController)) {
                
                self.dismiss(animated: true) {
                    self.navigationController?.pushViewController(toNextViewController, animated: animated)
                }
                
            } else {
                
                self.navigationController?.pushViewController(toNextViewController, animated: animated)
                
            }
            
        case .present:
            
            let navigationController = UINavigationController(rootViewController: toNextViewController)
            navigationController.navigationBar.barTintColor = UIColor.white
            navigationController.navigationBar.backgroundColor = UIColor.white
            
            if (self.checkPresentedViewController(viewController: sourceViewController)) {
                
                self.dismiss(animated: true) {
                    self.navigationController?.present(navigationController, animated: animated, completion: completion)
                }
                
            } else {
                
                self.navigationController?.present(navigationController, animated: animated, completion: completion)
                
            }
        }
        
    }
    
    private func checkPresentedViewController(viewController: UIViewController) -> Bool {

        guard let _ = viewController.presentedViewController else { return false }
        
        return true
        
    }
    
}

