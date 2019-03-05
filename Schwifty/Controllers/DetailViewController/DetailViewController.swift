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
    var isExpanded: Bool = false
    
    @IBOutlet weak var showMoreButton: UIButton!
    @IBOutlet weak var playerView: YouTubePlayerView!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.viewDidloaded()
    }
    
    // MARK: - IDetailView methods
    func setupView(withFamily family: Families) {
        
        avatarImage.contentMode = .scaleAspectFit
        
        guard let avatarUrl = family.avatarUrl else { return }
        
        self.showMoreButton.setTitle("Show more", for: .normal)
        
        title = family.name
        statusLabel.text = family.status
        avatarImage.setImageWithUrl(url: avatarUrl)
        descriptionLabel.text = family.description
        
        videoId = family.videoId
        
        playerReady(playerView)
        
        setBackgroundImage(withUrl: avatarUrl)
        
        showMoreButton.addTarget(self, action: #selector(expand), for: .touchUpInside)
        
    }
    
    func showMore() {
        
        UIView.animate(withDuration: 0.5) {
            self.descriptionLabel.numberOfLines = 0
            self.descriptionLabel.lineBreakMode = .byWordWrapping
            self.descriptionLabel.sizeToFit()
            self.showMoreButton.setTitle("Show less", for: .normal)
            self.view.layoutIfNeeded()
        }
        
        isExpanded.toggle()
        
    }
    
    func showLess() {
        
        UIView.animate(withDuration: 0.5) {
            self.descriptionLabel.numberOfLines = 5
            self.descriptionLabel.sizeToFit()
            self.showMoreButton.setTitle("Show more", for: .normal)
            self.view.layoutIfNeeded()
        }
        
        isExpanded.toggle()
        
    }
    
    @objc func expand(expanded: Bool) {
        
        presenter?.expandDidTapped(expanded: self.isExpanded)
        
    }
    
    // MARK: - Helper methods
    private func setBackgroundImage(withUrl url: String) {
        
        let bgImage = UIImageView(frame: UIScreen.main.bounds)
        bgImage.setImageWithUrl(url: url)
        bgImage.contentMode = .scaleAspectFit
        bgImage.alpha = 0.25
        self.view.insertSubview(bgImage, at: 0)
        
    }
    
    // MARK: - YouTubePlayerDelegate methods
    func playerReady(_ videoPlayer: YouTubePlayerView) {
        
        presenter?.loadVideo(videoPlayer: videoPlayer, withId: videoId)
        
    }
    
    func playerStateChanged(_ videoPlayer: YouTubePlayerView, playerState: YouTubePlayerState) {
        
        presenter?.playerStateChanged(videoPlayer: videoPlayer, playerState: playerState)
        
    }

}
