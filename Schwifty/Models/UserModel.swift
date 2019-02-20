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
    var latitude: Float?
    var longitude: Float?
    
    init(id: Int, firstName: String, lastName: String, avatarUrl: String, latitude: Float, longitude: Float) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.avatarUrl = avatarUrl
        self.latitude = latitude
        self.longitude = longitude
    }
    
}

struct MapModel: Codable {
    
    var lat: Double?
    var long: Double?
    
    mutating func initialize(data:[String:AnyObject]) {
        
        self.lat = data["latitude"] as? Double
        self.long = data["longitude"] as? Double
        
    }
    
}
