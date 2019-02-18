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
        
        let baseURL: String = EngkitCinemaAPI.baseUrl
        let userPath: String = EngkitCinemaAPI.userPath
        let url: String = "\(baseURL)\(userPath)"
        
        print("interactor called")
        networkRequest?.requestWith(URL: url, method: HTTPMethod.get, parameter: [:], successBlock: { (responses) in
            
            if let response = responses {
                self.presenter?.didReceiveSuccessWhileFetching(response: response)
            }
            
        }, failureBlock: { (error) in
            
            if let errors = error {
                self.presenter?.didReceiveFailedWhileFetching(error: errors)
            }
            
        })
        
    }
    
}
