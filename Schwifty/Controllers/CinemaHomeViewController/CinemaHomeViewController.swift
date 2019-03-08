//
//  CinemaHomeViewController.swift
//  Schwifty
//
//  Created by Engkit Satia Riswara on 13/02/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import UIKit

class CinemaHomeViewController: UIViewController {
    
    // MARK: - Properties
    var presenter: ICinemaHomePresenter?
    var load: UIActivityIndicatorView?

    @IBOutlet weak var movieCollectionView: UICollectionView?
    @IBOutlet weak var titleLabel: UILabel?
    
    let infoView: InfoView = {
        
        let view = InfoView()
        return view
    }()
    
    let settingsView: SettingsView = {
        
        let sv = SettingsView()
        return sv
        
    }()
    
    let visualEffectView: UIVisualEffectView = {
        
        let blurEffect = UIBlurEffect(style: .dark)
        let view = UIVisualEffectView(effect: blurEffect)
        return view
    }()
    
    // MARK: - Init
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
        return presenter?.family?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "moviesCollectionViewCell", for: indexPath) as? MoviesCollectionViewCell else { return UICollectionViewCell() }
        
        let selectedItem: Int = indexPath.item
        let selectedSection: Int = indexPath.section
        let itemIndexPath: Int =  2 * selectedSection + selectedItem
        
        if let family = presenter?.family?[itemIndexPath] {
            
            cell.set(forFamily: family)
            cell.delegate = self
            
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let selectedItem: Int = indexPath.item
        
        guard let familySelected = presenter?.family?[selectedItem] else { return }
        
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
        
        view.addSubview(visualEffectView)
        visualEffectView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        visualEffectView.alpha = 0
        
        settingsView.delegate = self
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(handleDismissal))
        visualEffectView.addGestureRecognizer(gesture)
        
        collectionViewInitialize()
        self.titleLabel?.text = "Favourite Fiction Characters"
        
        let barButtonItem = UIBarButtonItem(title: "Map", style: .plain, target: self, action: #selector(goToMapViewController))
        let barButtonItem2 = UIBarButtonItem(title: "More", style: .plain, target: self, action: #selector(handleMore))
        
        let barButtonItems: [UIBarButtonItem] = [barButtonItem2, barButtonItem]
        
        navigationItem.setRightBarButtonItems(barButtonItems, animated: true)
        
    }
    
    @objc private func handleMore() {
        
        self.settingsView.showSettings()
        
    }
    
    @objc private func handleDismissal() {
        
        UIView.animate(withDuration: 0.5, animations: {
            self.visualEffectView.alpha = 0
            self.infoView.alpha = 0
            self.infoView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        }) { (_) in
            self.infoView.removeFromSuperview()
            
        }
        
    }
    
    func refreshViewWithFetchedData() {
        
        DispatchQueue.main.async {
            self.movieCollectionView?.reloadData()
        }
        
    }
    
    func showErrorAlert(title: String, message: String) {
        
        self.showAlertWith(title: title, message: message)
        
    }
    
    @objc private func goToMapViewController() {

        presenter?.navigateToMapView()
        
    }
    
    func showLoading() {
        
        self.load = self.showLoading(type: .indicator)
        
    }
    
    func hideLoading() {
        
        self.hideLoading(loadingView: load)
        
    }
    
}


extension CinemaHomeViewController: MoviesCollectionCellDelegate {
    
    func handleLongPress(withFamily family: Families?) {
        
        view.addSubview(infoView)
        infoView.configureView()
        infoView.families = family
        
        infoView.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: view.frame.width - 64, height: view.frame.height / 1.5)
        infoView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        infoView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        infoView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        infoView.alpha = 0
        
        UIView.animate(withDuration: 0.5) {
            self.visualEffectView.alpha = 1
            self.infoView.alpha = 1
            self.infoView.transform = .identity
        }
        
    }
    
}

extension CinemaHomeViewController: SettingsViewDelegate {
    
    func navigateToViewController(withSetting setting: SettingComponents, animated: Bool) {
        
        presenter?.pushToServiceView(withSetting: setting)
        
    }
    
    
}
