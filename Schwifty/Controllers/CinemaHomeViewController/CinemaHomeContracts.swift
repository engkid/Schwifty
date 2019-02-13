//
//  CinemaHomeContracts.swift
//  Schwifty
//
//  Created by Engkit Satia Riswara on 13/02/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import Foundation

protocol ICinemaHomeView: class {
    
    func setupView()
    
}

protocol ICinemaHomeWireframe: class {
 
    func goToHome()
    
}

protocol ICinemaHomePresenter: class {
    
    func viewDidloaded()
    
}

protocol ICinemaHomeInteractor: class {
    
    func fetchMovies()
    
}
    

