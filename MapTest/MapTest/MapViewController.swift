//
//  MapViewController.swift
//  MapTest
//
//  Created by 김승찬 on 2022/10/19.
//

import UIKit

import SnapKit
import Then
import GoogleMaps

final class MapViewController: UIViewController, GMSMapViewDelegate {
    
    override func loadView() {
        
        let camera = GMSCameraPosition(latitude: 47.0169, longitude: -122.336471, zoom: 12)
        let mapID = GMSMapID(identifier: "9ad3dfa7d26de84a")
        let mapView = GMSMapView(frame: .zero, mapID: mapID, camera: camera)

            self.view = mapView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
}
