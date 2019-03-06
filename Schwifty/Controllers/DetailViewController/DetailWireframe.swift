//
//  DetailWireframe.swift
//  Schwifty
//
//  Created by Engkit Satia Riswara on 04/03/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import UIKit

class DetailWireframe: IDetailWireframe {
    
    func popToRoot(sourceView: IDetailView) {
        
        if let view = sourceView as? UIViewController {
            
            view.navigationController?.popToRootViewController(animated: true)
            
        }
        
    }
    
}
