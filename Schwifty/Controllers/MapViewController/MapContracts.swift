//
//  MapContracts.swift
//  Schwifty
//
//  Created by Engkit Satia Riswara on 19/02/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import Foundation

protocol IMapView: class {
    
    var presenter: IMapPresenter? { get set }
    
    func setUpView()
    
}

protocol IMapInteractor: class {
    
    var networkService: INetworkRequest? { get set }
    
}

protocol IMapPresenter: class {
    
    var view: IMapView? { get set }
    var interactor: IMapInteractor? { get set }
    var wireframe: IMapWireframe? { get set }
    
    func viewDidLoaded()
    
}

protocol IMapWireframe: class {
    
    func createModuleTo()
    
}
