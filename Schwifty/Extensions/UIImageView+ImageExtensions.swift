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
    
    func rescaleImage(image:UIImage, scaledToSize newSize:CGSize) -> UIImage{
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        image.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }
    
}
