// FavoritesPresenter.swift
// Copyright © RoadMap. All rights reserved.

/// Protocol for Favorites screen presenter
protocol FavoritesPresenterProtocol: AnyObject {
    /// Categories of product to show by view
    var recipes: [Recipe]? { get }
    /// Main initializer
    init(view: FavoritesViewProtocol, coordinator: BaseModuleCoordinator)
}

final class FavoritesPresenter: FavoritesPresenterProtocol {
    // MARK: - Public Properties

    var recipes: [Recipe]?

    // MARK: - Private Properties

    private weak var coordinator: BaseModuleCoordinator?
    private weak var view: FavoritesViewProtocol?

    // MARK: - Initialization

    init(view: FavoritesViewProtocol, coordinator: BaseModuleCoordinator) {
        self.view = view
        self.coordinator = coordinator
    }

    // MARK: - Public Methods
}
