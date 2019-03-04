//
//  DetailPresenter.swift
//  Schwifty
//
//  Created by Engkit Satia Riswara on 04/03/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import Foundation

class DetailPresenter: IDetailPresenter {
    
    weak var families: Families?
    weak var view: IDetailView?
    
    func viewDidloaded() {
        
        if let family = self.families {
            view?.setupView(withFamily: family)
        }
        
    }
    
}
