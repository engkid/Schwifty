//
//  AppConstants.swift
//  Schwifty
//
//  Created by Engkit Satia Riswara on 15/02/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import Foundation

enum NetworkEnvironment {
    
    case production
    case staging
    
}

struct EngkitCinemaAPI {
    
    static let baseUrl: String = "https://reqres.in"
    static let userPath: String = "/api/users?page=2"
    
}
