//
//  DefaultLoginCoordinator.swift
//  MapTest
//
//  Created by 김승찬 on 2022/10/21.
//

import UIKit

final class DefaultLoginCoordinator: LoginCoordinator {
    
    weak var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
    var loginViewController: LoginViewController
    var childCoordinators: [Coordinator] = []
    var type: CoordinatorType = .login
    
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.loginViewController = LoginViewController()
    }
    
    func start() {
        
    }
    
    func showNicknameViewController() {
        
    }
    
    func finish() {
        self.finishDelegate?.didFinish(childCoordinator: self)
    }
}

extension DefaultLoginCoordinator: CoordinatorFinishDelegate {
    
    func didFinish(childCoordinator: Coordinator) {
        self.childCoordinators.removeAll()
        self.finishDelegate?.didFinish(childCoordinator: self)
    }
}
