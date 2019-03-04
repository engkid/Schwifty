//
//  DetailViewController.swift
//  Schwifty
//
//  Created by Engkit Satia Riswara on 04/03/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, IDetailView {

    var presenter: DetailPresenter?
    
    var imageView: UIImageView? = {
        
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        
        return iv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func setupView() {
        
    }

}
