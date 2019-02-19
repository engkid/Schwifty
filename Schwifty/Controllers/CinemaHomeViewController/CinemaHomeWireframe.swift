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
        
        let mapViewController = MapViewController()
        
        return mapViewController
    }
    
    func navigateToMapView(from view: ICinemaHomeView) {
        
        let mapViewController = self.createModuleToMapView()
        
        if let sourceView = view as? UIViewController {
            sourceView.navigationController?.pushViewController(mapViewController, animated: true)
        }
        
    }
    
}
