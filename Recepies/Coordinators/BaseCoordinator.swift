//
//  BaseCoordinator.swift
//  Recepies
//
//  Created by Dmitry on 27.02.2024.
//

import UIKit

protocol BaseCoordinatorProtocol: AnyObject {
    
    var childCoordinators: [BaseCoordinatorProtocol] { get set }
    func start()
    
    func add(coordinator: BaseCoordinatorProtocol)
    
    func remove(coordinator: BaseCoordinatorProtocol)
    
    func setAsRoot(_ controller: UIViewController)
}

extension BaseCoordinatorProtocol {
    
    func add(coordinator: BaseCoordinatorProtocol) {
        childCoordinators.append(coordinator)
    }
    
    func remove(coordinator: BaseCoordinatorProtocol) {
        childCoordinators = childCoordinators.filter {$0 !== coordinator}
    }
    
    func setAsRoot(_ controller: UIViewController) {
        let window = UIApplication
            .shared
            .connectedScenes
            .compactMap {$0 as? UIWindowScene}
            .flatMap {$0.windows}
            .last { $0.isKeyWindow}
        window?.rootViewController = controller
    }
}
