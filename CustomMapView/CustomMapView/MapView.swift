//
//  MapView.swift
//  CustomMapView
//
//  Created by 김승찬 on 2022/10/14.
//

import UIKit

import GoogleMaps
import MapKit
import Then

class MapView: UIView {
    
    lazy var carLocationButton = UIButton()
    lazy var myLocationImage = UIImageView()
    lazy var map = MKMapView()
//
    lazy var favoriteButton = UIButton().then {
        $0.setTitle("즐겨찾는 존", for: .normal)
        $0.setImage(Image.favoriteBlack, for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.backgroundColor = .white
        $0.makeRounded(radius: 22)
        $0.dropShadow()
    }

    lazy var locationButton = UIButton().then {
        $0.backgroundColor = .white
        $0.setImage(Image.myLocation, for: .normal)
        $0.makeRounded(radius: 22)
        $0.dropShadow()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func setupView() {
        [carLocationButton, myLocationImage, map, favoriteButton, locationButton].forEach {
            addSubview($0)
        }
    }

    func setupConstraints() {
        map.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }

        favoriteButton.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(30)
            $0.leading.equalToSuperview().inset(20)
            $0.height.equalTo(44)
            $0.width.equalTo(120)
        }

        locationButton.snp.makeConstraints {
            $0.bottom.equalTo(safeAreaLayoutGuide).inset(30)
            $0.trailing.equalToSuperview().inset(20)
            $0.width.height.equalTo(44)
        }
    }
}


