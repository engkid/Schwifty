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
    var loading: LoadingIndicator?
    var load: UIActivityIndicatorView?
    
    var families: [Families]? {
        
        didSet {
            
            DispatchQueue.main.async {
                self.movieCollectionView?.reloadData()
            }
            
        }
        
    }

    @IBOutlet weak var movieCollectionView: UICollectionView?
    @IBOutlet weak var titleLabel: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.viewDidloaded()

    }

}

//MARK: CollectionView DataSource & Delegates
extension CinemaHomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    private func collectionViewInitialize() {
        
        movieCollectionView?.register(UINib(nibName: "MoviesCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "moviesCollectionViewCell")
        movieCollectionView?.delegate = self
        movieCollectionView?.dataSource = self
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 32, left: 8, bottom: 8, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return families?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "moviesCollectionViewCell", for: indexPath) as? MoviesCollectionViewCell else { return UICollectionViewCell() }
        
        let selectedItem: Int = indexPath.item
        let selectedSection: Int = indexPath.section
        let itemIndexPath: Int =  2 * selectedSection + selectedItem
        
        if let response = self.families {
            
            cell.set(forFamily: response[itemIndexPath])
            
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let selectedItem: Int = indexPath.item
        
        let selectedSection: Int = indexPath.section
        
        //TODO: - change 2 to model dataSource width
        //MARK: get item model indexPath sequenced
        let itemIndexPath: Int =  2 * selectedSection + selectedItem
        
        print("selected item at indexPath \(indexPath.item) section \(indexPath.section), index row \(indexPath.row) itemIndexPath \(itemIndexPath)")
        
        guard let familySelected = families?[itemIndexPath] else { return }
        
        presenter?.didSelectItem(withFamily: familySelected)
        
    }
    
}

//MARK: CollectioViewDelegateFlowLayout
extension CinemaHomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (view.frame.width - 36) / 2
        
        return CGSize(width: width, height: width * 1.5)
    }
    
}

//MARK: ICinemaHomeView implementations
extension CinemaHomeViewController: ICinemaHomeView {
    
    func setupView() {
        
        collectionViewInitialize()
        self.titleLabel?.text = "Our Little Family"
        
        let barButtonItem = UIBarButtonItem(title: "Our Journeys", style: .plain, target: self, action: #selector(goToMapViewController))
        
        self.navigationItem.rightBarButtonItem = barButtonItem
        
    }
    
    func populateWithResponses(response: [Families]) {
        
        self.families = response
        
    }
    
    func showErrorAlert(title: String, message: String) {
        
        self.showAlertWith(title: title, message: message)
        
    }
    
    @objc private func goToMapViewController() {

        presenter?.navigateToMapView()
        
    }
    
    func showLoading() {
        
        self.load = self.showLoading(type: .indicator)
//        self.showLoading(atView: self.view, type: .indicator)
        
    }
    
    func hideLoading() {
        
        self.hideLoading(loadingView: load)

//        self.loading?.hideLoading(atView: self.view)
        
    }
    
}
