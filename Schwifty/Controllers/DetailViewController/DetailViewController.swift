//
//  DetailViewController.swift
//  Schwifty
//
//  Created by Engkit Satia Riswara on 04/03/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import UIKit
import YouTubePlayer

class DetailViewController: UIViewController, IDetailView, YouTubePlayerDelegate {

    // MARK: - Properties
    var presenter: DetailPresenter?
    var videoId: String?
    
    @IBOutlet weak var playerView: YouTubePlayerView!
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
        
        videoId = family.videoId
        
        playerReady(playerView)
        
        let bgImage = UIImageView(frame: UIScreen.main.bounds)
        bgImage.setImageWithUrl(url: avatarUrl)
        bgImage.contentMode = .scaleAspectFit
        bgImage.alpha = 0.25
        self.view.insertSubview(bgImage, at: 0)
        
    }
    
    func playerReady(_ videoPlayer: YouTubePlayerView) {
        
        videoPlayer.loadVideoID(videoId ?? "")
        
    }

}
