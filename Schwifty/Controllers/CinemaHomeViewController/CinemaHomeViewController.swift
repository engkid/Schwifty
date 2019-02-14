//
//  CinemaHomeViewController.swift
//  Schwifty
//
//  Created by Engkit Satia Riswara on 13/02/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import UIKit

class CinemaHomeViewController: UIViewController {
    
    var presenter: ICinemaHomePresenter?
    
    var response: [String:AnyObject]? {
        
        didSet {
            
            movieCollectionView?.reloadData()
            
        }
        
    }

    @IBOutlet weak var movieCollectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.viewDidloaded()

    }

}

//MARK: CollectionView DataSource & Delegates
extension CinemaHomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        //TODO: - change it to model dataSource width
        return 2
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        //TODO: - change it to model dataSource height
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "moviesCollectionViewCell", for: indexPath) as? MoviesCollectionViewCell else { return UICollectionViewCell() }
        
        cell.movieImage?.image = UIImage(named: "searchIcon", in: Bundle.main, compatibleWith: nil)
        cell.titleLabel?.text = self.response?["first_name"] as? String
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let selectedItem: Int = indexPath.item
        
        let selectedSection: Int = indexPath.section
        
        //TODO: - change 2 to model dataSource width
        //MARK: get item model indexPath sequenced
        let itemIndexPath: Int =  2 * selectedSection + selectedItem
        
        print("selected item at indexPath \(indexPath.item) section \(indexPath.section), index row \(indexPath.row) itemIndexPath \(itemIndexPath)")
        
    }
    
}

//MARK: CollectioViewDelegateFlowLayout
extension CinemaHomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: ((self.view.frame.width / 2) - 8), height: (((self.view.frame.width / 2) - 8) * 1.5))
    }
    
}

//MARK: ICinemaHomeView implementations
extension CinemaHomeViewController: ICinemaHomeView {
    
    func setupView() {
        
        collectionViewInitialize()
        
        let barButtonItem = UIBarButtonItem(title: "Home", style: .plain, target: self, action: #selector(goToHome))
        
        self.navigationItem.rightBarButtonItem = barButtonItem
        
    }
    
    func populateWithResponses(response: [String:AnyObject]) {
        
        self.response = response
        
    }
    
    @objc func goToHome() {

        self.navigationController?.popToRootViewController(animated: true)
        
    }
    
    private func collectionViewInitialize() {
        
        movieCollectionView?.register(UINib(nibName: "MoviesCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "moviesCollectionViewCell")
        movieCollectionView?.delegate = self
        movieCollectionView?.dataSource = self
        
    }
    
}
