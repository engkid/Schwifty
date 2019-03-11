//
//  DetailViewController.swift
//  Schwifty
//
//  Created by Engkit Satia Riswara on 04/03/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController, IDetailView {
    

    // MARK: - Properties
    var presenter: DetailPresenter?
    var videoId: String?
    var isExpanded: Bool = false
    var dispatchWorkItem: DispatchWorkItem?
    
    let webView: WKWebView = {
        
        let wv = WKWebView()
        
        return wv
        
    }()
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var showMoreButton: UIButton!
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
        
        view.addSubview(webView)
        
        webView.anchor(top: statusLabel.bottomAnchor, left: containerView.leftAnchor, bottom: containerView.bottomAnchor, right: containerView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        avatarImage.contentMode = .scaleAspectFit
        
        guard let avatarUrl = family.avatarUrl else { return }
        
        self.showMoreButton.setTitle("Show more", for: .normal)
        
        title = family.name
        statusLabel.text = family.status
        avatarImage.setImageWithUrl(url: avatarUrl)
        descriptionLabel.text = family.description
        
        loadVideo(webView: webView, withId: family.videoId)
        
        setBackgroundImage(withUrl: avatarUrl)
        
        showMoreButton.addTarget(self, action: #selector(expand), for: .touchUpInside)
        
        let barButton = UIBarButtonItem(title: "To home", style: .plain, target: self, action: #selector(homeDidTap))
        
        navigationItem.rightBarButtonItem = barButton
        
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
    
    // MARK: - Selectors
    @objc func expand(expanded: Bool) {
        
        presenter?.expandDidTapped(expanded: self.isExpanded)
        
    }
    
    @objc func homeDidTap() {
        
        presenter?.popToRoot(sourceView: self)
        
    }
    
    // MARK: - Helper methods
    private func setBackgroundImage(withUrl url: String) {
        
        let bgImage = UIImageView(frame: UIScreen.main.bounds)
        bgImage.setImageWithUrl(url: url)
        bgImage.contentMode = .scaleAspectFit
        bgImage.alpha = 0.25
        self.view.insertSubview(bgImage, at: 0)
        
    }
    
    private func loadVideo(webView: WKWebView, withId videoId: String?) {
        
        presenter?.loadVideo(webView: webView, withId: videoId)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.dispatchWorkItem?.cancel()
        }
        
    }

}
