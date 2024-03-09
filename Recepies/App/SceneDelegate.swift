// SceneDelegate.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    private var appCoordinator: AppCoordinator?
    private let database = Database.shared
    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        configureWindow(scene: scene)
    }

    func sceneWillResignActive(_ scene: UIScene) {
        database.saveToUserDefaults()
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        database.setFromUserDefaults()
    }

    private func configureWindow(scene: UIScene) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        appCoordinator = AppCoordinator()
        appCoordinator?.start()
    }
}
