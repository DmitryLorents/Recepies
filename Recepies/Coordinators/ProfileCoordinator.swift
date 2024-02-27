// ProfileCoordinator.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Coordinator for Profile module
final class ProfileCoordinator: BaseModuleCoordinator {
    override func start() {
        showLogin()
    }

    func logOut() {
        onFinishFlow?()
    }

    private func showLogin() {
        setAsRoot(rootController)
    }
}
