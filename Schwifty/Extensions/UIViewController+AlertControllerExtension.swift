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
        
        self.show(alert, sender: self)
        
    }
    
    func navigateFrom(sourceViewController: UIViewController, toNextViewController: UIViewController, withTransition: TransitionMethod, animated: Bool, completion: (() -> Void)?) {
        
        switch withTransition {
            
        case .push:
            
            self.removeStackViewControllers(viewController: sourceViewController)
            
            self.navigationController?.pushViewController(toNextViewController, animated: animated)
        case .present:
            
            self.removeStackViewControllers(viewController: sourceViewController)
            
            self.navigationController?.present(toNextViewController, animated: animated, completion: completion)
        }
        
    }
    
    private func removeStackViewControllers(viewController: UIViewController) {

        guard var viewControllers = viewController.navigationController?.viewControllers else { return }
        
        for viewController in viewControllers {
            
            if !(viewController).isKind(of: viewController.classForCoder) {
                
                viewControllers.removeLast()
                
            }
            
        }
        
    }
    
}

