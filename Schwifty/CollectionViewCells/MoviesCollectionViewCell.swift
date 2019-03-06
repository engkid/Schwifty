//
//  MoviesCollectionViewCell.swift
//  Schwifty
//
//  Created by Engkit Satia Riswara on 13/02/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import UIKit

protocol MoviesCollectionCellDelegate {
    
    func handleLongPress(withFamily family: Families?)
    
}

class MoviesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var movieImage: UIImageView?
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var ratingLabel: UILabel?
    
    var delegate: MoviesCollectionCellDelegate?
    
    var family: Families?
    
    func set(forFamily family: Families) {
        
        self.movieImage?.layer.cornerRadius = 10
        self.ratingLabel?.layer.cornerRadius = 5
        self.movieImage?.layer.masksToBounds = true
        self.ratingLabel?.layer.masksToBounds = true
        self.movieImage?.contentMode = .scaleAspectFit
        
        guard let avatar = family.avatarUrl else { return }
        
        self.movieImage?.setImageWithUrl(url: avatar)
        self.titleLabel?.text = family.name
        self.ratingLabel?.text = family.status
        
        self.family = family
        
        assignLongPress()
        
    }
    
    func assignLongPress() {
        
        let longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
        
        self.addGestureRecognizer(longPressGestureRecognizer)
        
    }
    
    @objc func handleLongPress(sender: UILongPressGestureRecognizer) {
        
        if sender.state == .began {
            guard let family = self.family else { return }
            delegate?.handleLongPress(withFamily: family)
        }
        
    }

}
