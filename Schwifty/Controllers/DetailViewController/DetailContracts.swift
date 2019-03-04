//
//  DetailContracts.swift
//  Schwifty
//
//  Created by Engkit Satia Riswara on 04/03/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import Foundation

protocol IDetailPresenter: class {

    var families: Families? { get set }
    
    var view: IDetailView? { get }
    
    func viewDidloaded()
    
}

protocol IDetailWireframe: class {
    
}

protocol IDetailInteractor: class {
    
}

protocol IDetailView: class {
    
    func setupView(withFamily: Families)
    
}
