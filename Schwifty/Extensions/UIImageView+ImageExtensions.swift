//
//  UIImage+ImageExtensions.swift
//  Schwifty
//
//  Created by Engkit Satia Riswara on 15/02/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import UIKit
import SDWebImage

extension UIImageView {
    
    func setImageWithUrl(url: String) {
        
        self.sd_setImage(with: URL(string: url))
        
    }
    
}
