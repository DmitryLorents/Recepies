// ProfileCoordinator.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Coordinator for Profile module
final class ProfileCoordinator: BaseModuleCoordinator {
    override func start() {
        showLogin()
    }

    func logOut() {
        finishFlowHandler?()
    }

    private func showLogin() {
        setAsRoot(publicRootController)
    }
}
