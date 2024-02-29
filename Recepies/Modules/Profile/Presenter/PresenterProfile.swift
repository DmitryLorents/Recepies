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
}

/// Протокол презентера профиля
protocol ProfilePresenterProtocol: AnyObject {
    /// Координатор
    var coordinator: BaseModuleCoordinator? { get set }
    /// Массив опций
    var options: [OptionsProtocol] { get set }
    /// Информация о пользователе
    var profileUser: ProfileUserProtocol { get set }
    /// Загрузка алерта со сменой имени
    func setupAlert()
    /// Изменение имени в профиле
    /// - Parameter :  name - Имя пользователя
    func setTitleNameUser(name: String)
    /// Выбор ячейки
    /// - Parameter :  index - Индекс ячейки
    func didSetectItem(index: Int)
    /// Выход из профиля
    func logOutProfile()
}

/// Презентер профиля
final class ProfilePresenter: ProfilePresenterProtocol {
    // MARK: - Public Properties

    weak var view: ProfileViewProtocol?

    var coordinator: BaseModuleCoordinator?
    var options: [OptionsProtocol] = Options.makeOption()
    var profileUser: ProfileUserProtocol = ProfileUser.makeProfile()

    // MARK: - Public Methods

    func setTitleNameUser(name: String) {
        profileUser.userName = name
        view?.reloadData()
    }

    func setupAlert() {
        view?.showEditNameAlert()
    }

    func didSetectItem(index: Int) {
        if index == 0 {
            view?.openBunusView()
        } else if index == 2 {
            view?.showLogOutAlert()
        }
    }

    func logOutProfile() {}
}
