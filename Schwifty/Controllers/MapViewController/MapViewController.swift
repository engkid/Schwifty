//
//  MapViewController.swift
//  Schwifty
//
//  Created by Engkit Satia Riswara on 19/02/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let camera = GMSCameraPosition.camera(withLatitude: -6.9383029, longitude: 107.6663636, zoom: 17.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -6.8919232, longitude: 107.6033046)
        marker.title = "Yardin"
        marker.snippet = "Engkit & Windy"
        marker.map = mapView
        
        let marker2 = GMSMarker()
        marker2.position = CLLocationCoordinate2D(latitude: -6.9383029, longitude: 107.6663636)
        marker2.title = "The Wedding"
        marker2.snippet = "Windy & Engkit February, 2nd 2019\nSenbik Building"
        marker2.map = mapView
        
        if let image = UIImage(named: "engkitwindy"), let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 90, height: 60)) as UIImageView?  {
            
            imageView.image = image
            imageView.layer.cornerRadius = imageView.frame.height/2
            imageView.layer.masksToBounds = false
            
            marker2.icon = imageView.rescaleImage(image: image, scaledToSize: CGSize(width: 90.0, height: 60.0))
            
        }
    }

}
