//
//  SettingComponentCell.swift
//  Schwifty
//
//  Created by Engkit Satia Riswara on 08/03/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import UIKit

class SettingComponentCell: UICollectionViewCell {
    
    override var isHighlighted: Bool {
        
        didSet {
            
            UIView.animate(withDuration: 0.5) {
                self.backgroundColor = self.isHighlighted ? UIColor.darkGray : UIColor.white
                self.settingLabel.textColor = self.isHighlighted ? UIColor.white : UIColor.black
                self.imageView.tintColor = self.isHighlighted ? UIColor.white : UIColor.darkGray
            }
            
        }
        
    }
    
    var settingLabel: UILabel = {
        
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        return label
        
    }()
    
    var imageView: UIImageView = {
        
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        
        return iv
    }()
    
    func set(withSetting setting: SettingComponents) {
        
        addSubview(settingLabel)
        addSubview(imageView)
        
        settingLabel.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        imageView.anchor(top: nil, left: leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 20, height: 20)
        
        settingLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        settingLabel.anchor(top: nil, left: imageView.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 30)
        
        guard let settingName = setting.name, let settingImage = setting.imageName else { return }
        
        settingLabel.text = settingName
        imageView.image = UIImage(named: settingImage)?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = UIColor.darkGray
    }

}
