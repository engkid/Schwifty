//
//  InfoView.swift
//  Schwifty
//
//  Created by Engkit Satia Riswara on 06/03/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import UIKit

protocol InfoViewDelegate {
    
    func dismissInfoView()
    
}

class InfoView: UIView {
    
    // MARK: - Properties
    
    var delegate: InfoViewDelegate?
    
    var families: Families? {
        
        didSet {
            
            guard let family = self.families else { return }
            guard let avatarUrl = family.avatarUrl else { return }
            
            imageView.setImageWithUrl(url: avatarUrl)
            
        }
        
    }
    
    let imageView: UIImageView = {
        
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        
        return iv
    }()
    
    lazy var containerView: UIView = {
       
        let view = UIView()
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView() {
        
        backgroundColor = .white
        
        addSubview(imageView)
        imageView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 100, height: 150)
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
    }
    
}
