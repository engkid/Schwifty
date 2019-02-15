//
//  CinemaHomeContracts.swift
//  Schwifty
//
//  Created by Engkit Satia Riswara on 13/02/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import Foundation

protocol ICinemaHomeView: class {
    
    var presenter: ICinemaHomePresenter? { get set }
    
    func setupView()
    
    func goToHome()
    
    func populateWithResponses(response: [String:AnyObject])
    
}

protocol ICinemaHomeWireframe: class {
 
    var presenter: ICinemaHomePresenter? { get set }
    
}

protocol ICinemaHomePresenter: class {
    
    func didReceiveSuccessWhileFetching(response: [String:AnyObject])
    
    func viewDidloaded()
    
}

protocol ICinemaHomeInteractor: class {
    
    var presenter: ICinemaHomePresenter? { get set }
    var networkRequest: INetworkRequest? { get set }
    
    func fetchMovies()
    
}
    

