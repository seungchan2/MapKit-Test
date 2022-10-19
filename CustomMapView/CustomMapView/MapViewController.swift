//
//  MapViewController.swift
//  CustomMapView
//
//  Created by 김승찬 on 2022/10/14.
//

import UIKit

import GoogleMaps

final class MapViewController: UIViewController {
    
    private lazy var mapView = MapView()
    
    override func loadView() {
        self.view = mapView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
}

// Todo
// 위치 권한 설정
// 지도 커스텀 
