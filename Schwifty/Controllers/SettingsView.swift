//
//  SettingsView.swift
//  Schwifty
//
//  Created by Engkit Satia Riswara on 08/03/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import UIKit

protocol SettinsViewDelegate: class {
    
    func navigateToViewController(withService service: SettingComponents, animated: Bool)
    
}

class SettingsView: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let blackView: UIView = UIView()
    
    var delegate: SettinsViewDelegate?
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        return cv
    }()
    
    var settingsComponents: [SettingComponents] = {
        
        let sc = [
        
        SettingComponents(imageName: "setting", name: "Setting"),
        SettingComponents(imageName: "profile", name: "Profile"),
        SettingComponents(imageName: "feedback", name: "Feedback"),
        SettingComponents(imageName: "cancel", name: "Cancel")
        
        ]
        
        return sc
    }()
    
    let cellId = "SettingComponentCell"
    
    let cellHeight: CGFloat = 50
    
    func showSettings() {
        
        if let window = UIApplication.shared.keyWindow {
            
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleSettingDismissal))
            
            blackView.addGestureRecognizer(tapGesture)
            
            window.addSubview(blackView)
            window.addSubview(collectionView)
            
            let height: CGFloat = CGFloat(settingsComponents.count) * cellHeight
            let y = window.frame.height - height
            
            collectionView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: height)
            
            blackView.frame = window.frame
            blackView.alpha = 0
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                self.blackView.alpha = 1
                self.collectionView.frame = CGRect(x: 0, y: y, width: self.collectionView.frame.width, height: self.collectionView.frame.height)
                
            }, completion: nil)
            
        }
        
    }
    
    @objc private func handleSettingDismissal(completion: ((Bool) -> Void)?) {
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            
            self.blackView.alpha = 0
            
            if let window = UIApplication.shared.keyWindow {
                self.collectionView.frame = CGRect(x: 0, y: window.frame.height, width: self.collectionView.frame.width, height: self.collectionView.frame.height)
            }
            
        }, completion: completion)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return settingsComponents.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? SettingComponentCell else { return UICollectionViewCell() }
        
        let settingComp = settingsComponents[indexPath.item]
        cell.set(withSetting: settingComp)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let setting = settingsComponents[indexPath.item]
        
        self.handleSettingDismissal { [weak self] (completion: Bool) in
            
            self?.delegate?.navigateToViewController(withService: setting, animated: true)
            
        }
    }
    
    override init() {
        super.init()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(SettingComponentCell.self, forCellWithReuseIdentifier: cellId)
    }
    
}
