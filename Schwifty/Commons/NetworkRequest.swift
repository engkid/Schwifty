//
//  NetworkRequest.swift
//  Schwifty
//
//  Created by Engkit Satia Riswara on 14/02/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkRequest: INetworkRequest {
    
    func requestWith(URL: String, method: HTTPMethod, parameter: [String : Any], successBlock: @escaping ([String : AnyObject]) -> Void, failureBlock: @escaping (NSError) -> Void) {
        
        Alamofire.request(URL).responseJSON { (response) in
            
            if let json = response.result.value {
                
                print("serialized JSON => \(json)")
                
            }
            
            if let data = response.data, let utf8Text = String(data: data, encoding: String.Encoding.utf8) {
                
                do {
                    
                    let json = try JSON(data: data)
                    
                    let user = try JSONDecoder().decode(UserModel.self, from: data)
                    
                    let dictionaryArray = json["data"].arrayValue
                    
                    for i in 0 ... dictionaryArray.count - 1  {
                        
                        let jsonAsData = try dictionaryArray[i].rawData()
                        
                        let users = try JSONDecoder().decode(UserModel.self, from: jsonAsData)
                        
                    }
                    
                    let userLastName = json["data"][0]["last_name"].stringValue
                    
                    print("json => \(json["data"].count) user last name => \(userLastName) user => \(dictionaryArray) user => \(user)")
                    
                    if let responseUser = dictionaryArray.first?.dictionaryValue as [String:AnyObject]? {
                        successBlock(responseUser)
                    }
                    
                } catch let error as NSError? {
                    
                    if let errors = error {
                        failureBlock(errors)
                    }
                    
                }
                
                
                
                print("Data => \(utf8Text) ")
                
            }
            
        }
        
    }
    
}
