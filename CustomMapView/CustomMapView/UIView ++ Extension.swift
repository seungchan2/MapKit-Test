//
//  UIView ++ Extension.swift
//  CustomMapView
//
//  Created by 김승찬 on 2022/10/14.
//

import UIKit

extension UIView {
    func dropShadow() {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 5)
        self.layer.shadowOpacity = 0.3
        self.layer.shadowRadius = 5.0
    }
    
    func makeRounded(radius: CGFloat) {
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
    }
}
