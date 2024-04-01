// SceneDelegate.swift
// Copyright © RoadMap. All rights reserved.

import Swinject
import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    private var appCoordinator: AppCoordinator?
    private lazy var database = Database.shared
    private var container: Container!
    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        registerDependencies()
        configureWindow(scene: scene)
    }

    func sceneWillResignActive(_ scene: UIScene) {
        database.saveToUserDefaults()
    }

    private func registerDependencies() {
        container = Container()
        container?.register(Caretaker.self) { _ in Caretaker() }.inObjectScope(.container)
        container?.register(AuthServiceProtocol.self) { resolver in AuthService() }.inObjectScope(.container)
        container?.register(CoreDataManager.self) { _ in CoreDataManager.shared }.inObjectScope(.container)
        container?.register(CacheServiceProtocol.self) { resolver in
            CacheService(coreDataManager: resolver.resolve(CoreDataManager.self))
        }.inObjectScope(.container)
        container?.register(DataBaseProtocol.self) { _ in Database() }.inObjectScope(.container)
        container.register(RequestCreatorProtocol.self) { _ in RequestCreator() }.inObjectScope(.container)
        container.register(NetworkServiceProtocol.self) { resolver in
            NetworkService(requestCreator: resolver.resolve(RequestCreatorProtocol.self)!)
        }.inObjectScope(.container)

        container.register(LoadImageServiceProtocol.self, name: "newtworkService") { resolver in
            NetworkService(requestCreator: resolver.resolve(RequestCreatorProtocol.self)!)
        }.inObjectScope(.container)

        container.register(LoadImageServiceProtocol.self, name: "proxy") { resolver in
            Proxy(service: resolver.resolve(LoadImageServiceProtocol.self, name: "newtworkService")!)
        }.inObjectScope(.container)
        
        container.register(BuilderProtocol.self) { [weak container] _ in
            Builder(serviceContainer: container) }.inObjectScope(.container)
        container.register(MainTabBarViewController.self) { _ in MainTabBarViewController()  }
    }

    private func configureWindow(scene: UIScene) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        if let builder = container.resolve(BuilderProtocol.self) {
            appCoordinator = AppCoordinator(mainTabBarViewController: container.resolve(MainTabBarViewController.self), builder: builder)
            appCoordinator?.start()
        }
    }
}
