//
//  DetailViewController.swift
//  Schwifty
//
//  Created by Engkit Satia Riswara on 04/03/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, IDetailView, UIScrollViewDelegate {

    var presenter: DetailPresenter?
    
    var imageView: UIImageView = {
        
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.backgroundColor = .gray
        iv.layer.cornerRadius = 10
        
        return iv
    }()
    
    var descriptionLabel: UILabel = {
        
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.textColor = .white
        
        return label
    }()
    
    lazy var scrollView: UIScrollView = {
        
        let scroll = UIScrollView()
        scroll.showsHorizontalScrollIndicator = false
        
        scrollViewDidScroll(scroll)
        
        scroll.addSubview(descriptionLabel)
        scroll.addSubview(imageView)
        
        imageView.anchor(top: scroll.topAnchor, left: scroll.leftAnchor, bottom: scroll.bottomAnchor, right: descriptionLabel.leftAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 100, height: 150)
        descriptionLabel.anchor(top: scroll.topAnchor, left: imageView.rightAnchor, bottom: nil, right: scroll.rightAnchor, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 200, height: 0)
        
        scroll.backgroundColor = .gray
       
        return scroll
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.viewDidloaded()
    }
    
    func setupView(withFamily family: Families) {
        
        let topBarHeight = UIApplication.shared.statusBarFrame.size.height +
            (self.navigationController?.navigationBar.frame.height ?? 0.0)
        
        scrollView.delegate = self
        
        view.addSubview(scrollView)
        scrollView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: topBarHeight, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: view.frame.width, height: view.frame.height)
        
        guard let avatarUrl = family.avatarUrl else { return }
        
        imageView.setImageWithUrl(url: avatarUrl)
        descriptionLabel.text = family.description
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.x != 0 {
            scrollView.contentOffset.x = 0
        }
    }

}
