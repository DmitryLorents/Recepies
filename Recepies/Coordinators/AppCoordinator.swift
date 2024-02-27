//
//  AppCoordinator.swift
//  Recepies
//
//  Created by Dmitry on 27.02.2024.
//

import UIKit

class AppCoordinator {
    
    var childCoordinators: [BaseCoordinatorProtocol] = []
    private var tabBarViewController: MainTabBarViewController?
    private var builder = Builder()
    
    private func toMain() {
        tabBarViewController = MainTabBarViewController()
        //Set Recepies
        
        //Set Favorites
        
        //Set Profile
    }
    
    private func toAuth() {
        
    }
}

// MARK: - AppCoordinator - BaseCoordinatorProtocol

extension AppCoordinator: BaseCoordinatorProtocol {
    
    func start() {
        if "login" == "login" {
            toMain()
        } else {
            toAuth()
        }
    }
}
