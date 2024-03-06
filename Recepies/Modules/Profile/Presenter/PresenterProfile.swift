// PresenterProfile.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Profile screen protocol
protocol ProfileViewProtocol: AnyObject {
    /// Calling an alert with a name change
    func showEditNameAlert()
    /// Calling a profile exit alert
    func showLogOutAlert()
    /// Updating data in a table
    func reloadData()
    /// Opening the curtain with bonuses
    func openBunusView()
    /// Open the Terms screen
    func setupTermsView()
}

/// Profile presenter protocol
protocol ProfilePresenterProtocol: AnyObject {
    /// Profile initialization
    init(view: ProfileViewProtocol, coordinator: BaseModuleCoordinator)
    /// Array of options
    var options: [OptionsProtocol] { get set }
    /// User information
    var profileUser: ProfileUserProtocol { get set }
    /// Loading an alert with a name change
    func setupAlert()
    /// Changing your profile name
    func setTitleNameUser(name: String)
    /// Cell selection
    func didSetectItem(index: Int)
    /// Exit profile
    func logOutProfile()
}

/// Презентер профиля
final class ProfilePresenter: ProfilePresenterProtocol {
    // MARK: - Public Properties

    var options: [OptionsProtocol] = Options.makeOption()
    var profileUser: ProfileUserProtocol = ProfileUser.makeProfile()

    // MARK: - Private Properties

    private weak var view: ProfileViewProtocol?
    private var coordinator: BaseModuleCoordinator?

    // MARK: - Initializers

    init(view: ProfileViewProtocol, coordinator: BaseModuleCoordinator) {
        self.view = view
        self.coordinator = coordinator
    }

    // MARK: - Public Methods

    func setTitleNameUser(name: String) {
        profileUser.userName = name
        view?.reloadData()
    }

    func setupAlert() {
        view?.showEditNameAlert()
    }

    func didSetectItem(index: Int) {
        switch index {
        case 0:
            view?.openBunusView()
        case 1:
            view?.setupTermsView()
        case 2:
            view?.showLogOutAlert()
        default:
            break
        }
    }

    func logOutProfile() {}
}
