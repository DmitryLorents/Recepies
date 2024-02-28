// SceneDelegate.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    private var appCoordinator: AppCoordinator?
    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        configureWindow(scene: scene)
    }

    private func configureWindow(scene: UIScene) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        let rootView = CategoryView()
        let category = Category.makeCategory()[4]
        let presenter = CategoryPresenter(view: rootView, category: category)
        rootView.presenter = presenter
        window?.rootViewController = rootView
//        appCoordinator = AppCoordinator()
//        appCoordinator?.start()
    }
}
