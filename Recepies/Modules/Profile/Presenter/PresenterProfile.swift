// PresenterProfile.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Profile presenter protocol
protocol ProfilePresenterProtocol: AnyObject {
    /// Profile initialization
    init(view: ProfileViewProtocol, coordinator: BaseModuleCoordinator, careTaker: CareTakerProtocol?)
    /// Array of options
    var options: [OptionsProtocol] { get set }
    /// User information
    var user: User? { get set }
    /// Loading an alert with a name change
    func setupAlert()
    /// Changing your profile name
    func setTitleNameUser(name: String)
    /// Cell selection
    func didSetectItem(index: Int)
    /// Exit profile
    func logOutProfile()
    /// Loading galery
    func setupGalery()
    /// Save avatar
    func saveAvatar(image: Data)
    /// Avatar data
    func avatarData() -> Data?
}

/// Презентер профиля
final class ProfilePresenter: ProfilePresenterProtocol {
    // MARK: - Public Properties

    var options: [OptionsProtocol] = Options.makeOption()
    var user: User?

    // MARK: - Private Properties

    private weak var view: ProfileViewProtocol?
    private var coordinator: BaseModuleCoordinator?
    private var careTaker: CareTakerProtocol?

    // MARK: - Initializers

    init(view: ProfileViewProtocol, coordinator: BaseModuleCoordinator, careTaker: CareTakerProtocol?) {
        self.view = view
        self.coordinator = coordinator
        self.careTaker = careTaker
        user = careTaker?.loadUser()
    }

    // MARK: - Public Methods

    func avatarData() -> Data? {
        careTaker?.loadImage()
    }

    func saveAvatar(image: Data) {
        careTaker?.saveImage(data: image)
        view?.reloadData()
    }

    func setupGalery() {
        view?.showImageChooser()
    }

    func setTitleNameUser(name: String) {
        careTaker?.updateUserName(name: name)
        user = careTaker?.loadUser()
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
            if let profileCoordinator = coordinator as? ProfileCoordinator {
                profileCoordinator.showPartnersScren()
            }
        case 3:
            view?.showLogOutAlert()
        default:
            break
        }
    }

    func logOutProfile() {
        if let profileCoordinator = coordinator as? ProfileCoordinator {
            profileCoordinator.logOut()
        }
    }
}
