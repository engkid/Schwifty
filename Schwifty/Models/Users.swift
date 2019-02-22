//
//  Users.swift
//  Schwifty
//
//  Created by Engkit Satia Riswara on 21/02/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import Foundation

enum Job: String, Codable {
    
    case ios
    case android
    case fullstack
    case none
    
    enum CodingKeys: String, CodingKey {
        
        case iOS = "IOS"
        case Android = "ANDROID"
        case Fullstack = "FULLSTACK"
        case None = ""
        
    }
    
}

class Users: Codable {
    
    var id: Int
    var firstName: String
    var lastName: String
    var avatar: String
    var job: Job
    
    enum CodingKeys: String, CodingKey {
        
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
        case job
        
    }
    
    required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(Int.self, forKey: .id)
        self.avatar = try container.decode(String.self, forKey: .avatar)
        self.firstName = try container.decode(String.self, forKey: .firstName)
        self.lastName = try container.decode(String.self, forKey: .lastName)
        self.job = try container.decodeIfPresent(Job.self, forKey: .job) ?? .none
        
    }
    
    
}
