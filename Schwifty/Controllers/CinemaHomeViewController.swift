//
//  CinemaHomeViewController.swift
//  Schwifty
//
//  Created by Engkit Satia Riswara on 13/02/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import UIKit

class CinemaHomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

}


private extension CinemaHomeViewController {
    
    private func setupView() {
        
        let barButtonItem = UIBarButtonItem(title: "Home", style: .plain, target: self, action: #selector(goToHome))
        
        self.navigationItem.rightBarButtonItem = barButtonItem
        
    }
    
    @objc private func goToHome() {
        
        self.navigationController?.popToRootViewController(animated: true)
        
    }
    
}
