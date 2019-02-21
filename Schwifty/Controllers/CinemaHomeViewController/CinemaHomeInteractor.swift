//
//  CinemaHomeInteractor.swift
//  Schwifty
//
//  Created by Engkit Satia Riswara on 13/02/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class CinemaHomeInteractor: ICinemaHomeInteractor {
    
    var networkRequest: INetworkRequest?
    
    func getFamilies(successBlock: @escaping ([Families]) -> Void, failureBlock: @escaping (Error) -> Void) {
        
        var families = [Families]()
        
        families = [
            
            Families(id: 1, name: "Engkit", status: "Papa", avatarUrl: "https://i.imgur.com/dbucqYG.jpg", latitude: -6.9383029, longitude: 107.6663636),
            Families(id: 2, name: "Windy", status: "Mama", avatarUrl: "https://i.imgur.com/hdtTObG.jpg", latitude: -6.9383029, longitude: 107.6663636),
            Families(id: 3, name: "Windy & Engkit Jr", status: "Junior", avatarUrl: "https://i.imgur.com/ts5wsXj.jpg", latitude: -6.9383029, longitude: 107.6663636),
            Families(id: 4, name: "", status: "", avatarUrl: "", latitude: 0.0, longitude: 0.0)
            
        ]
        
        print("families count => \(families.count)")
        
        successBlock(families)
        
    }

}
