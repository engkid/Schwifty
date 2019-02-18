//
//  CinemaHomeContracts.swift
//  Schwifty
//
//  Created by Engkit Satia Riswara on 13/02/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import Foundation
import Alamofire

protocol ICinemaHomeView: class {
    
    var presenter: ICinemaHomePresenter? { get set }
    
    func setupView()
    
    func goToHome()
    
    func populateWithResponses(response: [String:AnyObject])
    
    func showErrorAlert(title: String, message: String)
    
}

protocol ICinemaHomeWireframe: class {
 
    var presenter: ICinemaHomePresenter? { get set }
    
}

protocol ICinemaHomePresenter: class {
    
    func didReceiveSuccessWhileFetching(response: [String:AnyObject])
    
    func didReceiveFailedWhileFetching(error: Error)
    
    func viewDidloaded()
    
}

protocol ICinemaHomeInteractor: class {
    
    var presenter: ICinemaHomePresenter? { get set }
    var networkRequest: INetworkRequest? { get set }
    
    func fetchMovies()
    
    func getMovies(successBlock: @escaping ([String:AnyObject]) -> Void, failureBlock: @escaping (Error) -> Void)
    
}
    

