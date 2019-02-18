//
//  CinemaHomeInteractor.swift
//  Schwifty
//
//  Created by Engkit Satia Riswara on 13/02/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

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
    
    func getMovies(successBlock: @escaping ([String:AnyObject]) -> Void, failureBlock: @escaping (Error) -> Void) {
        
        let baseURL: String = EngkitCinemaAPI.baseUrl
        let userPath: String = EngkitCinemaAPI.userPath
        let url: String = "\(baseURL)\(userPath)"
        
        networkRequest?.makeRequestWith(URL: url, method: HTTPMethod.get, parameter: [:], successBlock: { (responseData) in
            
            let data = responseData
            let utf8Text = String(data: data, encoding: String.Encoding.utf8)
            
            do {
                
                let json = try JSON(data: data)
                
                let _ = try JSONDecoder().decode(UserModel.self, from: data)
                
                let dictionaryArray = json["data"].arrayValue
                
                let pageLimit = json["page"].intValue
                
                let perPage = json["per_page"].intValue
                
                let total = json["total"].intValue
                
                let totalPages = json["total_pages"].intValue
                
                for i in 0 ... dictionaryArray.count - 1  {
                    
                    let jsonAsData = try dictionaryArray[i].rawData()
                    
                    let _ = try JSONDecoder().decode(UserModel.self, from: jsonAsData)
                    
                }
                
                let userLastName = json["data"][0]["last_name"].stringValue
                
                print("json => \(json["data"].count) user last name => \(userLastName) responseData => \(dictionaryArray) pagelimit => \(pageLimit), perPage => \(perPage), total => \(total), totalPages => \(totalPages)")
                
                if let responseUser = dictionaryArray[0].dictionaryValue as [String:AnyObject]? {
                    successBlock(responseUser)
                }
                
            } catch let error as NSError? {
                
                if let errorCallback = error {
                    failureBlock(errorCallback)
                }
                
            }
            
//            self.presenter?.didReceiveSuccessWhileFetching(response:    )
            
        }, failureBlock: { (error) in
            
            if let errorResponse = error {
                self.presenter?.didReceiveFailedWhileFetching(error: errorResponse as NSError)
            }
            
        })
        
    }

    
}
