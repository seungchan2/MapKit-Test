//
//  SceneDelegate.swift
//  CustomMapView
//
//  Created by 김승찬 on 2022/10/14.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.windowScene = windowScene
        window?.rootViewController = UINavigationController(rootViewController: MapViewController())
        window?.makeKeyAndVisible()
    }
}

