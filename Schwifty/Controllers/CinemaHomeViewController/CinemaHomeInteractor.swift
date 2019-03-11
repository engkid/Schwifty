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
        
        guard let url = URL(string:"https://www.mocky.io/v2/5c85dd76340000550689bd03") else { return }
        
//        networkRequest?.makeRequestWith(URL: "https://www.mocky.io/v2/5c7e20003100007b003760f5", method: .post, parameter: [:], successBlock: { (data) in
//
//            do {
//
//                let family = try JSONDecoder().decode([Families].self, from: data)
//
//                family.forEach({ (fam) in
//                    families.append(fam)
//                })
//
//                successBlock(families)
//                
//            } catch let error {
//
//                print("Failed to decode json response with error: ", error.localizedDescription)
//                failureBlock(error)
//            }
//
//        }, failureBlock: { (error) in
//
//        })
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let errors = error {
                
                failureBlock(errors)
                return
            }
            
            guard let data = data else { return }
            
            do {
                
                let family = try JSONDecoder().decode([Families].self, from: data)
                
                successBlock(family)
                
            } catch let error {
                
                print("Failed to decode json response with error: ", error.localizedDescription)
                failureBlock(error)
            }
            
        }.resume()
        
    }

}
