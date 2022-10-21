//
//  CoordinatorDelegate.swift
//  MapTest
//
//  Created by 김승찬 on 2022/10/21.
//

import Foundation

protocol CoordinatorFinishDelegate: AnyObject {
    
    func didFinish(childCoordinator: Coordinator)
}
