//
//  DefaultAppCoordinator.swift
//  MapTest
//
//  Created by 김승찬 on 2022/10/21.
//

import UIKit

final class DefaultAppCoordinator: AppCoordinator {

    weak var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
    var childCoordinators = [Coordinator]()
    var type: CoordinatorType { .app }

    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.setNavigationBarHidden(true, animated: true)
    }
    
    
    func start() {
        // UserDefaults 유무에 따라 로직 분리
        
        self.showMapFlow()
    }
    
    
    func showLoginFlow() {
        let loginCoordinator = DefaultLoginCoordinator(self.navigationController)
        loginCoordinator.finishDelegate = self
        loginCoordinator.start()
        childCoordinators.append(loginCoordinator)
    }
    
    func showMapFlow() {
        let mapCoordinator = DefaultMapCoordinator(self.navigationController)
        mapCoordinator.finishDelegate = self
        mapCoordinator.start()
        childCoordinators.append(mapCoordinator)
    }
}

extension DefaultAppCoordinator: CoordinatorFinishDelegate {

    func didFinish(childCoordinator: Coordinator) {
        self.childCoordinators = self.childCoordinators.filter({ $0.type != childCoordinator.type })
        
        self.navigationController.viewControllers.removeAll()
        
        switch childCoordinator.type {
        case .login:
            self.showMapFlow()
        case .map:
            self.showLoginFlow()
        default:
            break
        }
    }
}
