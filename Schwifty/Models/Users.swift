//
//  Users.swift
//  Schwifty
//
//  Created by Engkit Satia Riswara on 21/02/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import Foundation

struct Users: Codable {
    
    var id: Int
    var firstName: String
    var lastName: String
    var avatar: String
    
    enum CodingKeys: String, CodingKey {
        
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
        
    }
    
}
