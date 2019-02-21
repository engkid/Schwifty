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
    
    func getUsers(successBlock: @escaping ([Users]?) -> Void, failureBlock: @escaping (Error?) -> Void) {
        
        let baseURL: String = EngkitCinemaAPI.baseUrl
        let userPath: String = EngkitCinemaAPI.userPath
        let url: String = "\(baseURL)\(userPath)"
        
        var users = [Users]()
        
        networkService?.requestWith(URL: url, method: .get, parameter: [:], successBlock: { (response) in
            
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
    
}
