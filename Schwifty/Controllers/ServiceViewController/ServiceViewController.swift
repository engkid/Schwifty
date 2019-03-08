//
//  ServiceViewController.swift
//  Schwifty
//
//  Created by Engkit Satia Riswara on 08/03/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import UIKit

class ServiceViewController: UIViewController {

    var setting: SettingComponents?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = setting?.type?.rawValue
    }

}
