//
//  UserModel.swift
//  Schwifty
//
//  Created by Engkit Satia Riswara on 14/02/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import Foundation

class Families: Codable {
    
    var id: Int?
    var name: String?
    var status: String?
    var description: String?
    var avatarUrl: String?
    var latitude: Float?
    var longitude: Float?
    
    init(id: Int, name: String, status: String, description: String, avatarUrl: String, latitude: Float, longitude: Float) {
        self.id = id
        self.name = name
        self.status = status
        self.description = description
        self.avatarUrl = avatarUrl
        self.latitude = latitude
        self.longitude = longitude
    }
    
}

struct MapModel: Codable {
    
    var lat: Double?
    var long: Double?
    
    enum CodingKeys: String, CodingKey {
        
        case lat = "latitude"
        case long = "longitude"
        
    }
    
//    mutating func initialize(data:[String:AnyObject]) {
//
//        self.lat = data["latitude"] as? Double
//        self.long = data["longitude"] as? Double
//
//    }
    
}
