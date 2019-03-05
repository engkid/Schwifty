//
//  DetailPresenter.swift
//  Schwifty
//
//  Created by Engkit Satia Riswara on 04/03/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import Foundation
import YouTubePlayer

class DetailPresenter: IDetailPresenter {
    
    weak var families: Families?
    weak var view: IDetailView?
    
    func viewDidloaded() {
        
        if let family = self.families {
            view?.setupView(withFamily: family)
        }
        
    }
    
    func expandDidTapped(expanded: Bool) {
        
        if expanded {
            
            view?.showLess()
            
        } else {
            
            view?.showMore()
            
        }
        
    }
    
    func loadVideo(videoPlayer: YouTubePlayerView, withId id: String?) {
        
        guard let videoId = id else { return }
        
        videoPlayer.loadVideoID(videoId)
        
    }
    
    func playerStateChanged(videoPlayer: YouTubePlayerView, playerState: YouTubePlayerState) {
        
        switch playerState {
        case .Ended:
            
            let orientation = UIInterfaceOrientation.portrait.rawValue
            UIDevice.current.setValue(orientation, forKey: "orientation")
            
            return
        default:
            break
        }
        
    }
    
}
