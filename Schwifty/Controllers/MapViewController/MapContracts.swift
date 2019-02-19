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
    
}

protocol IMapInteractor: class {
    
}

protocol IMapPresenter: class {
    
}

protocol IMapWireframe: class {
    
}
