//
//  CinemHomePresenter.swift
//  Schwifty
//
//  Created by Engkit Satia Riswara on 13/02/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import Foundation
import UIKit

class CinemaHomePresenter: ICinemaHomePresenter {
    
    var interactor: ICinemaHomeInteractor?
    weak var view: ICinemaHomeView?
    var wireframe: ICinemaHomeWireframe?
    
    var family: [Families]? {
        
        didSet {
            
            guard let families = self.family else { return }
            
            self.view?.populateWithResponses(response: families)
            
        }
        
    }
    
    init(interactor: ICinemaHomeInteractor, view: ICinemaHomeView, wireframe: ICinemaHomeWireframe) {
        self.interactor = interactor
        self.view = view
        self.wireframe = wireframe
    }
    
    func viewDidloaded() {
        view?.setupView()
    
        view?.showLoading()
        interactor?.getFamilies(successBlock: { [weak self] (families) in
            
            self?.family = families
            self?.view?.hideLoading()
            
        }, failureBlock: { [weak self] error in
            
            self?.view?.showErrorAlert(title: "Error", message: "Failed to fetch data from server")
            
        })

    }
    
    func navigateToMapView() {
        guard let cinemaView = self.view else { return }
        
        wireframe?.navigateToMapView(from: cinemaView)
        
    }
    
    func didSelectItem(withFamily family: Families) {
        guard let cinemaView = self.view else { return }
        
        wireframe?.navigateToDetail(fromView: cinemaView, withFamily: family)
        
    }
    
    func pushToServiceView(withSetting setting: SettingComponents) {
        guard let cinemaView = self.view else { return }
        
        wireframe?.pushToServiceView(fromView: cinemaView, withSetting: setting)
        
    }
    
}
