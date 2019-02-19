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
    
    func populateWithResponses(response: [String:AnyObject])
    
    func showErrorAlert(title: String, message: String)
    
}

protocol ICinemaHomeWireframe: class {
    
    func createModuleToMapView() -> UIViewController
    
    func navigateToMapView(from view: ICinemaHomeView)
    
}

protocol ICinemaHomePresenter: class {
    
    func viewDidloaded()
    
    func navigateToMapView()
}

protocol ICinemaHomeInteractor: class {
    
    var presenter: ICinemaHomePresenter? { get set }
    var networkRequest: INetworkRequest? { get set }
    
    func fetchMovies()
    
    func getMovies(successBlock: @escaping ([String:AnyObject]) -> Void, failureBlock: @escaping (Error) -> Void)
    
}
    

