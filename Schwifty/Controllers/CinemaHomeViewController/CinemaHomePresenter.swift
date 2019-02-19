//
//  CinemHomePresenter.swift
//  Schwifty
//
//  Created by Engkit Satia Riswara on 13/02/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import Foundation

class CinemaHomePresenter: ICinemaHomePresenter {
    
    /*MARK:
     
     this is interesting, I deallocate the presenter with 3 weak properties (view, interactor, wireframe) to move it to the homeViewController (view)... somehow got
     nil class for interactor and wireframe fixed it by changing weak to strong reference *still have no idea whats wrong... need to figure out
     
     */
    var interactor: ICinemaHomeInteractor?
    weak var view: ICinemaHomeView?
    var wireframe: ICinemaHomeWireframe?
    
    init(interactor: ICinemaHomeInteractor, view: ICinemaHomeView, wireframe: ICinemaHomeWireframe) {
        self.interactor = interactor
        self.view = view
        self.wireframe = wireframe
    }
    
    func viewDidloaded() {
        view?.setupView()
    
        interactor?.getMovies(successBlock: { [weak self] response in
            
            self?.view?.populateWithResponses(response: response)
            
        }, failureBlock: { [weak self] error in
            
            self?.view?.showErrorAlert(title: "Error", message: "Failed to fetch data from server")
            
        })
    }
    
    func navigateToMapView() {
        guard let cinemaView = self.view else { return }
        
        wireframe?.navigateToMapView(from: cinemaView)
        
    }
    
}
