//
//  CinemaHomeInteractor.swift
//  Schwifty
//
//  Created by Engkit Satia Riswara on 13/02/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import Foundation
import Alamofire

class CinemaHomeInteractor: ICinemaHomeInteractor {
    
    var presenter: ICinemaHomePresenter?
    var networkRequest: INetworkRequest?
    
    func fetchMovies() {
        
        
        let url: String = "https://reqres.in/api/users?page=2"
        
    
        print("interactor called")
        networkRequest?.requestWith(URL: url, method: HTTPMethod.get, parameter: [:], successBlock: { (response) in
            
        }, failureBlock: { (error) in
            
        })
        
    }
    
}
