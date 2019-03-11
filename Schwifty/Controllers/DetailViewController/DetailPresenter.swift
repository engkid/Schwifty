//
//  DetailPresenter.swift
//  Schwifty
//
//  Created by Engkit Satia Riswara on 04/03/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import Foundation
import WebKit

class DetailPresenter: IDetailPresenter {
    
    weak var families: Families?
    weak var view: IDetailView?
    var wireframe: IDetailWireframe?
    
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
    
    func loadVideo(webView: WKWebView, withId id: String?) {
        
        guard let vidId = id, let url = URL(string: "https://www.youtube.com/embed/\(vidId)") else { return }
        
        webView.load(URLRequest(url: url))
        
    }
    
    func popToRoot(sourceView: IDetailView) {
        
        wireframe?.popToRoot(sourceView: sourceView)
        
    }
    
}
