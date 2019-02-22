//
//  LoadingIndicator.swift
//  Schwifty
//
//  Created by Engkit Satia Riswara on 22/02/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import UIKit

class LoadingIndicator: UIView {
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    func showLoading(fromView view: UIView) {
        
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        activityIndicator.center.x = (view.frame.width / 2) - activityIndicator.bounds.width + 12
        activityIndicator.center.y = view.frame.height / 2
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.gray
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        
    }
    
    func hideLoading(fromView view: UIView) {
        
        activityIndicator.stopAnimating()
        
    }
    
}
