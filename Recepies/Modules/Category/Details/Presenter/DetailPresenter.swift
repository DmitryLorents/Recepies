// DetailPresenter.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Протокол для экрана деталей
protocol DetailViewProtocol: AnyObject {
}

/// Протокол презентера деталей
protocol DetailPresenterProtocol: AnyObject {
    /// Инициализация протокола
    init(view: DetailViewProtocol, coordinator: BaseModuleCoordinator, recipe: Recipe)
    var recipe: Recipe? { get set }
}

final class DetailPresenter: DetailPresenterProtocol {
    var recipe: Recipe?
    
    weak var view: DetailViewProtocol?
    weak var coordinator: BaseModuleCoordinator?
    

    init(view: DetailViewProtocol, coordinator: BaseModuleCoordinator, recipe: Recipe) {
        self.view = view
        self.coordinator = coordinator
        self.recipe = recipe
    }
}
