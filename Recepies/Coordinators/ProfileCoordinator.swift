// ProfileCoordinator.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Coordinator for Profile module
final class ProfileCoordinator: BaseModuleCoordinator {
    func logOut() {
        onFinishFlow?()
    }
}
