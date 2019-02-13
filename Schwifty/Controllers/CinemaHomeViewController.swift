//
//  CinemaHomeViewController.swift
//  Schwifty
//
//  Created by Engkit Satia Riswara on 13/02/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import UIKit

class CinemaHomeViewController: UIViewController {

    @IBOutlet weak var movieCollectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionViewInitialize()
        setupView()
    }

}


extension CinemaHomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 2
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "moviesCollectionViewCell", for: indexPath) as? MoviesCollectionViewCell else { return UICollectionViewCell() }
        
        cell.movieImage?.image = UIImage(named: "searchIcon", in: Bundle.main, compatibleWith: nil)
        
        return cell
    }
    
    private func collectionViewInitialize() {
        
        movieCollectionView?.register(UINib(nibName: "MoviesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "moviesCollectionViewCell")
        movieCollectionView?.delegate = self
        movieCollectionView?.dataSource = self
        
    }
    
    
}

extension CinemaHomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: ((self.view.frame.width / 2) - 16), height: (((self.view.frame.width / 2) - 16) * 1.5))
    }
    
}

private extension CinemaHomeViewController {
    
    private func setupView() {
        
        let barButtonItem = UIBarButtonItem(title: "Home", style: .plain, target: self, action: #selector(goToHome))
        
        self.navigationItem.rightBarButtonItem = barButtonItem
        
    }
    
    @objc private func goToHome() {
        
        self.navigationController?.popToRootViewController(animated: true)
        
    }
    
}
