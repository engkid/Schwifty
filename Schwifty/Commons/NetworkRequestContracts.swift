//
//  NetworkRequestContracts.swift
//  Schwifty
//
//  Created by Engkit Satia Riswara on 14/02/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import Foundation
import Alamofire

typealias networkingSuccessBlock = (_ response: [String:Any]?) -> Void
typealias networkingFailureBlock = (_ error: NSError?) -> Void

protocol INetworkRequest: class {
    
    func makeRequestWith(URL: String, method: HTTPMethod, parameter: [String:Any], successBlock: @escaping (Data) -> Void, failureBlock: @escaping(Error?) -> Void)
    func requestWith(URL: String, method: HTTPMethod, parameter: [String:Any], successBlock:@escaping networkingSuccessBlock, failureBlock:@escaping networkingFailureBlock)
    
}
