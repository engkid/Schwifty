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
    
    var networkRequest: INetworkRequest?
    
    func getUsers(successBlock: @escaping ([Users]?) -> Void, failureBlock: @escaping (Error?) -> Void) {
        
        let baseURL: String = EngkitCinemaAPI.baseUrl
        let userPath: String = EngkitCinemaAPI.userPath
        let url: String = "\(baseURL)\(userPath)"
        
        var users = [Users]()
        
        networkRequest?.requestWith(URL: url, method: .get, parameter: [:], successBlock: { (response) in
            
            for user in response?["data"] as! [Any] {
                
                do {
                    
                    let jsonData = try JSONSerialization.data(withJSONObject: user, options: JSONSerialization.WritingOptions.prettyPrinted)
                    let jsonString = String(data: jsonData, encoding: String.Encoding.utf8)
                    let data = jsonString?.data(using: String.Encoding.utf8)
                    let jsonDecoder = JSONDecoder()
                    let user = try jsonDecoder.decode(Users.self, from: data!)
                    
                    users.append(user)
                    
                } catch {
                    
                }
                
            }
            
            successBlock(users)
            
        }, failureBlock: { (error) in
            
            
            
        })
        
    }
    
    
    func getMovies(successBlock: @escaping ([UserModel]) -> Void, failureBlock: @escaping (Error) -> Void) {
        
        let baseURL: String = EngkitCinemaAPI.baseUrl
        let userPath: String = EngkitCinemaAPI.userPath
        let url: String = "\(baseURL)\(userPath)"
        
        var users = [UserModel]()
        
        users = [
            
            UserModel(id: 1, firstName: "Engkit Satia Riswara", lastName: "Papa", avatarUrl: "https://i.imgur.com/dbucqYG.jpg", latitude: -6.9383029, longitude: 107.6663636),
            UserModel(id: 2, firstName: "Windy Novita Wulandari", lastName: "Mama", avatarUrl: "https://i.imgur.com/hdtTObG.jpg", latitude: -6.9383029, longitude: 107.6663636),
            UserModel(id: 3, firstName: "Windy & Engkit Jr", lastName: "Junior", avatarUrl: "https://i.imgur.com/ts5wsXj.jpg", latitude: -6.9383029, longitude: 107.6663636),
            UserModel(id: 4, firstName: "", lastName: "", avatarUrl: "", latitude: 0.0, longitude: 0.0)
            
        ]
        
        print("user count => \(users.count)")
        
        networkRequest?.makeRequestWith(URL: url, method: .get, parameter: [:], successBlock: { (responseData) in
            
            let data = responseData
            
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
                
                successBlock(users)
                
            } catch let error as NSError? {
                
                if let errorCallback = error {
                    failureBlock(errorCallback)
                }
                
            }
            
        }, failureBlock: { (error) in
            
            if let errorRes = error {
                
                failureBlock(errorRes)
                
            }
            
        })
        
    }

}
