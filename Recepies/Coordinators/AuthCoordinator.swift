// AuthCoordinator.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Coordinator for Auth module
final class AuthCoordinator: BaseModuleCoordinator {
    override func start() {
        showLogin()
    }

    func onFinish() {
        onFinishFlow?()
    }

    private func showLogin() {
        setAsRoot(rootController)
    }
}
