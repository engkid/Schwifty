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
    
    func showLoading()
    
    func hideLoading()
    
    func populateWithResponses(response: [Families])
    
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
    
    var networkRequest: INetworkRequest? { get set }
    
    func getFamilies(successBlock: @escaping ([Families]) -> Void, failureBlock: @escaping (Error) -> Void)
    
}
    

