// DetailPresenter.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Протокол для экрана деталей
protocol DetailViewProtocol: AnyObject {}

/// Протокол презентера деталей
protocol DetailPresenterProtocol: AnyObject {
    /// Инициализация протокола
    init(view: DetailViewProtocol, coordinator: BaseModuleCoordinator)
    var recipesDetail: Category? { get set }
}

final class DetailPresenter: DetailPresenterProtocol {
    var recipesDetail: Category?

    weak var view: DetailViewProtocol?
    weak var coordinator: BaseModuleCoordinator?

    init(view: DetailViewProtocol, coordinator: BaseModuleCoordinator) {
        self.view = view
        self.coordinator = coordinator
    }

    func getCategory(category: Category) {
        recipesDetail = category
    }
}
