// PresenterBonus.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Протокол для презентера экрана бонусов
protocol BonusPresenterProtocol: AnyObject {
    /// Закрытие экрана бонусов
    func dismisView()
}

protocol BonusViewProtocol: AnyObject {
    /// Вызов закрытия экрана
    func closeView()
}

final class BonusPresenter: BonusPresenterProtocol {
    // MARK: - Public Properties

    weak var view: BonusViewProtocol?

    // MARK: - Public Methods

    func dismisView() {
        view?.closeView()
    }
}
