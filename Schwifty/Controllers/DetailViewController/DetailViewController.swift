//
//  DetailViewController.swift
//  Schwifty
//
//  Created by Engkit Satia Riswara on 04/03/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, IDetailView {

    // MARK: - Properties
    var presenter: DetailPresenter?
    
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.viewDidloaded()
    }
    
    // MARK: - Helper components
    func setupView(withFamily family: Families) {
        
        avatarImage.contentMode = .scaleAspectFit
        
        guard let avatarUrl = family.avatarUrl else { return }
        
        title = family.name
        statusLabel.text = family.status
        avatarImage.setImageWithUrl(url: avatarUrl)
        descriptionLabel.text = family.description
        
    }

}
