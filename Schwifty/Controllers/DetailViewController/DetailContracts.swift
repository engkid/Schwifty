//
//  DetailContracts.swift
//  Schwifty
//
//  Created by Engkit Satia Riswara on 04/03/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import Foundation
import YouTubePlayer

protocol IDetailPresenter: class {

    var families: Families? { get set }
    
    var view: IDetailView? { get }
    
    func viewDidloaded()
    
    func expandDidTapped(expanded: Bool)
    
    func loadVideo(videoPlayer: YouTubePlayerView, withId id: String?)
    
    func playerStateChanged(videoPlayer: YouTubePlayerView, playerState: YouTubePlayerState)
    
}

protocol IDetailWireframe: class {
    
}

protocol IDetailInteractor: class {
    
}

protocol IDetailView: class {
    
    func setupView(withFamily: Families)
    
    func expand(expanded: Bool)
    
    func showMore()
    
    func showLess()
    
}
