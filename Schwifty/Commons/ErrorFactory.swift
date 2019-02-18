//
//  ErrorFactory.swift
//  Schwifty
//
//  Created by Engkit Satia Riswara on 18/02/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import Foundation

enum ErrorFactory: Error, LocalizedError {
    
    case requestFailed
    case failedToMapData
    case invalidRequest
    
    var errorDescription: String? {
        return localizedDescription
    }
    
    var localizedDescription: String? {
        switch self {
        case .requestFailed:
            return "Failed to get data from request"
        case .failedToMapData:
            return "Mapping data failed"
        case .invalidRequest:
            return "Request invalid"
            
        }
    }
}
