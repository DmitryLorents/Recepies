// SceneDelegate.swift
// Copyright © RoadMap. All rights reserved.

import Swinject
import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    private var appCoordinator: AppCoordinator?
    private lazy var database = serviceContainer?.resolve(DataBaseProtocol.self)
    private var serviceContainer: Container?
    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        registerDependencies()
        configureWindow(scene: scene) { appCoordinator in
            appCoordinator?.start()
        }
    }

    func sceneWillResignActive(_ scene: UIScene) {
        database?.saveToUserDefaults()
    }

    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        guard let firstURL = URLContexts.first?.url,
              let components = URLComponents(url: firstURL, resolvingAgainstBaseURL: true) else { return }
        let host = components.host
        switch host {
        case "open_favorites_screen":
            configureWindow(scene: scene) { appCoordinator in
                appCoordinator?.openFavorites()
            }
        case "open_user_profile":
            configureWindow(scene: scene) { appCoordinator in
                appCoordinator?.openProfile()
            }
        case "change_user_name":
            let queryItems = components.queryItems
            let nameQuery = queryItems?.first(where: { $0.name == "name" })
            let userName = nameQuery?.value ?? "No name provided"
            configureWindow(scene: scene) { appCoordinator in
                appCoordinator?.change(userName: userName)
            }
        default:
            print("Incorrect deeplink command")
        }
    }

    private func registerDependencies() {
        serviceContainer = Container()
        serviceContainer?.register(CareTakerProtocol.self) { _ in Caretaker() }.inObjectScope(.container)
        serviceContainer?.register(AuthServiceProtocol.self) { resolver in
            AuthService(careTaker: resolver.resolve(CareTakerProtocol.self))
        }.inObjectScope(.container)
        serviceContainer?.register(CoreDataManager.self) { _ in CoreDataManager.shared }.inObjectScope(.container)
        serviceContainer?.register(CacheServiceProtocol.self) { resolver in
            CacheService(coreDataManager: resolver.resolve(CoreDataManager.self))
        }.inObjectScope(.container)
        serviceContainer?.register(DataBaseProtocol.self) { _ in Database() }.inObjectScope(.container)
        serviceContainer?.register(RequestCreatorProtocol.self) { _ in RequestCreator() }.inObjectScope(.container)
        serviceContainer?.register(NetworkServiceProtocol.self) { resolver in
            NetworkService(requestCreator: resolver.resolve(RequestCreatorProtocol.self))
        }.inObjectScope(.container)

        serviceContainer?.register(LoadImageServiceProtocol.self, name: "newtworkService") { resolver in
            NetworkService(requestCreator: resolver.resolve(RequestCreatorProtocol.self))
        }.inObjectScope(.container)

        serviceContainer?.register(LoadImageServiceProtocol.self, name: "proxy") { resolver in
            Proxy(service: resolver.resolve(LoadImageServiceProtocol.self, name: "newtworkService"))
        }.inObjectScope(.container)

        serviceContainer?.register(BuilderProtocol.self) { [weak serviceContainer] _ in
            Builder(serviceContainer: serviceContainer)
        }.inObjectScope(.container)
        serviceContainer?.register(MainTabBarViewController.self) { _ in MainTabBarViewController() }
    }

    private func configureWindow(scene: UIScene, handler: (AppCoordinator?) -> ()) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        if let builder = serviceContainer?.resolve(BuilderProtocol.self) {
            appCoordinator = AppCoordinator(
                mainTabBarViewController: serviceContainer?.resolve(MainTabBarViewController.self),
                builder: builder
            )
            handler(appCoordinator)
        }
    }
}
