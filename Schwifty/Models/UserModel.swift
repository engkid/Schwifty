//
//  UserModel.swift
//  Schwifty
//
//  Created by Engkit Satia Riswara on 14/02/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import Foundation

class UserModel: Codable {
    
    var id: Int?
    var firstName: String?
    var lastName: String?
    var avatarUrl: String?
    
    init(id: Int, firstName: String, lastName: String, avatarUrl: String) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.avatarUrl = avatarUrl
    }
    
}
