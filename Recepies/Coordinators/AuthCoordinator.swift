// AuthCoordinator.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Coordinator for Auth module
final class AuthCoordinator: BaseModuleCoordinator {
    override func start() {
        showLogin()
    }

    func finishFlow() {
        finishFlowHandler?()
    }

    private func showLogin() {
        setAsRoot(publicRootController)
    }
}
