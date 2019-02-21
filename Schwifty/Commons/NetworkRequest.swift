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
    
    func makeRequestWith(URL: String, method: HTTPMethod, parameter: [String:Any], successBlock: @escaping (Data) -> Void, failureBlock: @escaping(Error?) -> Void) {
        
        Alamofire.request(URL).responseJSON { (response) in
            
            if response.result.isSuccess {
                
                guard let data = response.data else { return }
            
                successBlock(data)
                
            } else {
                
                failureBlock(response.error)
                
            }
            
            
        }
        
    }
    
    func requestWith(URL: String, method: HTTPMethod, parameter: [String : Any], successBlock: @escaping ([String : Any]?) -> Void, failureBlock: @escaping (NSError?) -> Void) {
        
        Alamofire.request(URL).responseJSON { (response) in
            
            if (response.result.isSuccess) {
                
                guard let responseObject = response.result.value as? [String:Any] else { return }
                
                successBlock(responseObject)
                
            } else {
                
                failureBlock(response.result.error as NSError?)
                
            }
            
            
        }
        
    }
    
}
