// MainTabBarViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Tab bar of our application
final class MainTabBarViewController: UITabBarController {
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setColorIcon()
    }

    // MARK: - Private Methods

    private func setColorIcon() {
        tabBar.unselectedItemTintColor = .black
        tabBar.tintColor = .currentBlue
    }
}
