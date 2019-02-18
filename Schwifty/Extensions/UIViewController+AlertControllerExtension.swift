//
//  UIViewController+AlertControllerExtension.swift
//  Schwifty
//
//  Created by Engkit Satia Riswara on 18/02/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showAlertWith(title: String, message: String) {
        
        let alert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let alertButton: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
        alert.addAction(alertButton)
        
        self.show(alert, sender: self)
        
    }
    
}

