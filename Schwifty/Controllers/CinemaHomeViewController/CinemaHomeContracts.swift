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
    
    func createModuleToDetailView(withFamily family: Families) -> UIViewController
    
    func navigateToMapView(from view: ICinemaHomeView)
    
    func navigateToDetail(fromView view: ICinemaHomeView, withFamily family: Families)
    
    func createModuleToServiceView(withSetting setting: SettingComponents) -> UIViewController
    
    func pushToServiceView(fromView view: ICinemaHomeView, withSetting setting: SettingComponents)
    
}

protocol ICinemaHomePresenter: class {
    
    var family: [Families]? { get set }
    
    func viewDidloaded()
    
    func navigateToMapView()
    
    func didSelectItem(withFamily family: Families)
    
    func pushToServiceView(withSetting setting: SettingComponents)
}

protocol ICinemaHomeInteractor: class {
    
    var networkRequest: INetworkRequest? { get set }
    
    func getFamilies(successBlock: @escaping ([Families]) -> Void, failureBlock: @escaping (Error) -> Void)
    
}
    

