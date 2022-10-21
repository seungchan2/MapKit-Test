//
//  DefaultMapCoordinator.swift
//  MapTest
//
//  Created by 김승찬 on 2022/10/21.
//

import UIKit

final class DefaultMapCoordinator: MapCoordinator {
   
    weak var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
    var mapViewController: MapViewController
    var childCoordinators: [Coordinator] = []
    var type: CoordinatorType = .map
    
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.mapViewController = MapViewController()
    }
    
    func start() {
        self.navigationController.viewControllers = [self.mapViewController]
    }
    
    func showSettingViewController() {
        
    }
    
    func showSideViewController() {
        
    }
    
    func finish() {
        self.finishDelegate?.didFinish(childCoordinator: self)
    }
}
