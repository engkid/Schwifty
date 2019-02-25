//
//  UIViewController+LoadingViewExtensions.swift
//  Schwifty
//
//  Created by Engkit Satia Riswara on 25/02/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import UIKit

enum LoadingType {
    
    case container
    case message
    case indicator
    
}

extension UIViewController {
    
    func showLoading(type: LoadingType) -> UIActivityIndicatorView {
        
        switch type {
        case .container:
            let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
            return activityIndicator
        case .indicator:
            let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
            activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
            activityIndicator.center.x = (self.view.frame.width / 2) - activityIndicator.bounds.width + 12
            activityIndicator.center.y = self.view.frame.height / 2
            activityIndicator.hidesWhenStopped = true
            activityIndicator.style = UIActivityIndicatorView.Style.gray
            self.view.addSubview(activityIndicator)
            activityIndicator.startAnimating()
            return activityIndicator
        case .message:
            let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
            return activityIndicator
        }
        
    }
    
    func hideLoading(loadingView: UIActivityIndicatorView?) {
        
        if let loading = loadingView {
            
            loading.stopAnimating()
            loading.isHidden = true
            
        }
        
    }
    
    
}
