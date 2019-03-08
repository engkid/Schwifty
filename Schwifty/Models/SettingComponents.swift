//
//  SettingComponents.swift
//  Schwifty
//
//  Created by Engkit Satia Riswara on 08/03/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import Foundation

enum SettingType: String {
    
    case setting = "Setting"
    case profile = "Profile"
    case feedback = "Feedback"
    case cancel = "Cancel"
    
}

class SettingComponents: NSObject {
    
    var imageName: String?
    var type: SettingType?
    
    init(imageName: String?, type: SettingType?) {
        self.imageName = imageName
        self.type = type
    }
    
}
