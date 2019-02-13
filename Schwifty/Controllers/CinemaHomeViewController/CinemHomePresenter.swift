//
//  CinemHomePresenter.swift
//  Schwifty
//
//  Created by Engkit Satia Riswara on 13/02/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import Foundation

class CinemaHomePresenter: ICinemaHomePresenter {
    
    weak var interactor: ICinemaHomeInteractor?
    weak var view: ICinemaHomeView?
    weak var wireframe: ICinemaHomeWireframe?
    
    init(interactor: ICinemaHomeInteractor, view: ICinemaHomeView, wireframe: ICinemaHomeWireframe) {
        self.interactor = interactor
        self.view = view
        self.wireframe = wireframe
    }
    
    func viewDidloaded() {
        
    }
    
}
