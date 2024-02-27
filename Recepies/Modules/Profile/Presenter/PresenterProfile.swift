// PresenterProfile.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Протокол экрана профиля
protocol ProfileViewProtocol: AnyObject {
    func showEditNameAlert()
}

/// Протокол презентера профиля
protocol ProfilePresenterProtocol: AnyObject {
    var coordinator: BaseModuleCoordinator? { get set }
    var options: [Options] { get set }
    var profileUser: ProfileUser { get set }
    func setupAlert()
}

/// Презентер профиля
class ProfilePresenter: ProfilePresenterProtocol {
    var coordinator: BaseModuleCoordinator?

    weak var view: ProfileViewProtocol?

    var options: [Options] = Options.makeOption()
    var profileUser = ProfileUser.makeProfile()
    func setupAlert() {
        view?.showEditNameAlert()
    }
}
