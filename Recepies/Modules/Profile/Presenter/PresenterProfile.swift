// PresenterProfile.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Протокол экрана профиля
protocol ProfileViewProtocol: AnyObject {
    /// Вызов алерта со сменой имени
    func showEditNameAlert()
    /// Вызов алерта выхода из профиля
    func showLogOutAlert()
    /// Обновление данных в таблице
    func reloadData()
    /// Открытие шторки с бонусами
    func openBunusView()
    /// Открытие экрана  Terms
    func setupTermsView()
}

/// Протокол презентера профиля
protocol ProfilePresenterProtocol: AnyObject {
    /// Инициализация профиля
    init(view: ProfileViewProtocol, coordinator: BaseModuleCoordinator)
    /// Массив опций
    var options: [OptionsProtocol] { get set }
    /// Информация о пользователе
    var profileUser: ProfileUserProtocol { get set }
    /// Загрузка алерта со сменой имени
    func setupAlert()
    /// Изменение имени в профиле
    func setTitleNameUser(name: String)
    /// Выбор ячейки
    func didSetectItem(index: Int)
    /// Выход из профиля
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
        case 0: view?.openBunusView()
        case 1: view?.setupTermsView()
        case 2: view?.showLogOutAlert()
        default:
            break
        }
    }

    func logOutProfile() {}
}
