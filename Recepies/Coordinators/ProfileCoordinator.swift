// ProfileCoordinator.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Coordinator for Profile module
final class ProfileCoordinator: BaseModuleCoordinator {
    // MARK: - Private Properties

    private let builder: BuilderProtocol?

    // MARK: - Initialization

    init(builder: BuilderProtocol?) {
        self.builder = builder
    }

    // MARK: - Public Methods

    override func start() {
        showLogin()
    }

    func logOut() {
        finishFlowHandler?()
    }

    func showPartnersScren() {
        let partnersScreenName = "Our partners"
        if let partnersScreen = builder?.makePartnersModule(coordinator: self) {
            publicRootController.pushViewController(partnersScreen, animated: true)
            log(.openScreen(screenName: partnersScreenName))
        }
    }

    func getMapMarkerDetails() -> MapMarkerDetailsView? {
        builder?.makeMapMarkerDetailsModule()
    }

    // MARK: - Privat Methods

    private func showLogin() {
        setAsRoot(publicRootController)
    }
}
