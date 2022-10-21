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
import CoreLocation

// +, - , 현재 위치 바꾸기

final class MapViewController: UIViewController, GMSMapViewDelegate {
    
    private let coordinate = CLLocationCoordinate2D(latitude: 37.54330366639085, longitude: 127.04455548501139)
    
    private var locationManager: CLLocationManager = CLLocationManager()
    private var currentLocation: CLLocation!
    
    
    let camera = GMSCameraPosition(latitude: 37.54330366639085, longitude: 127.04455548501139, zoom: 12)
    let mapID = GMSMapID(identifier: "9ad3dfa7d26de84a")
    var mapView = GMSMapView()
    let marker = GMSMarker() // 마커 객체 생성


    override func loadView() {

        mapView = GMSMapView(frame: .zero, camera: camera)
        self.view = mapView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
   
        self.mapView.isMyLocationEnabled = true
        //        self.mapView.
  
        
     
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()

        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        print("333")
        move(at: locationManager.location?.coordinate)
        print("444")
    }
    
    func move(at coordinate: CLLocationCoordinate2D?) {
        guard let coordinate = coordinate else {
            return
        }

        let latitude = coordinate.latitude
        let longitude = coordinate.longitude
        
        let camera = GMSCameraPosition.camera(withLatitude: latitude, longitude: longitude, zoom: 14)
        mapView.camera = camera
        
        marker.position = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        print(111, marker.position)
        marker.title = "My Position"
        marker.snippet = "Known"
        marker.map = mapView
    }
}
    extension MapViewController: CLLocationManagerDelegate {
        func checkCurrentLocationAuthorization(authorizationStatus: CLAuthorizationStatus) {
            switch authorizationStatus {
            case .notDetermined:
                // 배터리 효율 높임
                locationManager.desiredAccuracy = kCLLocationAccuracyBest
                locationManager.requestWhenInUseAuthorization()
                locationManager.startUpdatingLocation()
                print("notDetermined")
            case .restricted, .denied:
                print("2222")
            case .authorizedAlways, .authorizedWhenInUse:
                findMyLocation()
            @unknown default:
                print("unknown")
            }
            if #available(iOS 14.0, *) {
                let accuracyState = locationManager.accuracyAuthorization
                switch accuracyState {
                case .fullAccuracy:
                    print("full")
                case .reducedAccuracy:
                    print("reduced")
                @unknown default:
                    print("Unknown")
                }
            }
        }
        
        // 나의 현재 위치를 찾음
        private func findMyLocation() {
            guard locationManager.location != nil else {
                locationManager.requestWhenInUseAuthorization()
                return
         }
            print(locationManager.location, 111)
        }
        
        func checkUserLocationServicesAuthorization() {
            // iOS 14부터는 정확도 설정이 들어감
            // 시스템 설정을 다르게 해줌
            let authorizationStatus: CLAuthorizationStatus
            
            if #available(iOS 14, *) {
                authorizationStatus = locationManager.authorizationStatus
            } else {
                authorizationStatus = CLLocationManager.authorizationStatus()
            }
            
            if CLLocationManager.locationServicesEnabled() {
                checkCurrentLocationAuthorization(authorizationStatus: authorizationStatus)
            } else {
                print("위치 권한 켜주세요")
            }
        }
        
        // iOS14 이상: 앱이 위치 관리자를 생성하고, 승인 상태가 변경이 될 때 대리자에게 승인 상태를 알려줌
        func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
            checkUserLocationServicesAuthorization()
        }
        
        // iOS14 미만: 앱이 위치 관리자를 생성하고, 승인 상태가 변경이 될 때 대리자에게 승인 상태를 알려줌
        func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
            checkUserLocationServicesAuthorization()
        }
        
        
        
        func distance(from: CLLocationCoordinate2D) -> CLLocationDistance {
            let from = CLLocation(latitude: from.latitude, longitude: from.longitude)
            let to = CLLocation(latitude: 37.54330366639082, longitude: 127.04455548501139)
            return from.distance(from: to)
        }
        
        
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
              guard let firstLocation = locations.first else {
                  return
              }
              
              move(at: firstLocation.coordinate)
          }
    }
