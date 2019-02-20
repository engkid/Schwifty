//
//  MapInteractor.swift
//  Schwifty
//
//  Created by Engkit Satia Riswara on 19/02/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import Foundation

class MapInteractor: IMapInteractor {
    
    var networkService: INetworkRequest?
    
    let mapUrl: String = "this is a url"
    
    func getMapData(successBlock: @escaping (MapModel) -> Void, failureBlock: @escaping (Error?) -> Void) {
        
        networkService?.makeRequestWith(URL: mapUrl, method: .get, parameter: [:], successBlock: { (response) in
            
            //TODO: mapping Data goes here
            var mapModel = MapModel()
            mapModel.initialize(data: ["latitude": -6.1255634 as AnyObject,
                                        "longitude": 107.9283124 as AnyObject
                                        ])
            
            successBlock(mapModel)
            
        }, failureBlock: { (error) in
          
            if let errorRes = error {
                
                failureBlock(errorRes)
                
            }
            
        })
        
    }
    
}
