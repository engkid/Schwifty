//
//  CinemaHomeWireframe.swift
//  Schwifty
//
//  Created by Engkit Satia Riswara on 13/02/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import Foundation

class CinemaHomeWireframe: ICinemaHomeWireframe {
    
    var presenter: ICinemaHomePresenter?
    weak var view: ICinemaHomeView?
    
    init(view: ICinemaHomeView) {
        self.view = view
    }
    
    func goToHome() {
        
        self.view?.goToHome()
        
    }
    
    
}
