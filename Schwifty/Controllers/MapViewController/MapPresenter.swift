//
//  MapPresenter.swift
//  Schwifty
//
//  Created by Engkit Satia Riswara on 19/02/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import Foundation

class MapPresenter: IMapPresenter {
    
    weak var view: IMapView?
    var interactor: IMapInteractor?
    var wireframe: IMapWireframe?
    
    func viewDidLoaded() {
        
        self.view?.setUpView()
        interactor?.getMapData(successBlock: { (map) in
            
        }, failureBlock: { (error) in
            
        })
        
    }
    
}
