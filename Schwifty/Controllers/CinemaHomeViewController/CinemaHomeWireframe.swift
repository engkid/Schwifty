//
//  CinemaHomeWireframe.swift
//  Schwifty
//
//  Created by Engkit Satia Riswara on 13/02/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import UIKit

class CinemaHomeWireframe: ICinemaHomeWireframe {
    
    func createModuleToMapView() -> UIViewController {
        
        guard let mapViewController: IMapView = MapViewController() as IMapView?,
            let mapPresenter: IMapPresenter = MapPresenter() as IMapPresenter?,
            let mapInteractor: IMapInteractor = MapInteractor() as IMapInteractor?,
            let networkService: INetworkRequest = NetworkRequest() as INetworkRequest?
            else { return UIViewController() }
        
        mapInteractor.networkService = networkService
        mapPresenter.view = mapViewController
        mapPresenter.interactor = mapInteractor
        mapViewController.presenter = mapPresenter
        
        return mapViewController as! UIViewController
    }
    
    func navigateToMapView(from view: ICinemaHomeView) {
        
        let mapViewController = self.createModuleToMapView()
        
        if let sourceView = view as? UIViewController {
            sourceView.navigationController?.pushViewController(mapViewController, animated: true)
        }
        
    }
    
    func createModuleToDetailView(withFamily family: Families) -> UIViewController {
        
        guard let detailViewController = DetailViewController() as DetailViewController?, let detailPresenter = DetailPresenter() as DetailPresenter?, let wireframe = DetailWireframe() as? DetailWireframe else { return UIViewController() }
        
        detailViewController.presenter = detailPresenter
        detailPresenter.families = family
        detailPresenter.view = detailViewController
        detailPresenter.wireframe = wireframe
        
        return detailViewController
    }
    
    func navigateToDetail(fromView view: ICinemaHomeView, withFamily family: Families) {
        
        let detailVC = self.createModuleToDetailView(withFamily: family)
        
        if let sourceView = view as? UIViewController {
            sourceView.navigationController?.pushViewController(detailVC, animated: true)
        }
        
    }
    
}
