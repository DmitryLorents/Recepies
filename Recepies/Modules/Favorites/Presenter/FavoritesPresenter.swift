// FavoritesPresenter.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Protocol for Favorites screen presenter
protocol FavoritesPresenterProtocol: AnyObject {
    /// Categories of product to show by view
    var recipes: [Recipe]? { get }
    /// Main initializer
    init(view: FavoritesViewProtocol, coordinator: BaseModuleCoordinator)
    /// Removes recipe from recipes at index
    func removeRecipe(at indexPath: IndexPath)
}

final class FavoritesPresenter: FavoritesPresenterProtocol {
    // MARK: - Public Properties

    var recipes: [Recipe]? = Recipe.makeRecipes()

    // MARK: - Private Properties

    private weak var coordinator: BaseModuleCoordinator?
    private weak var view: FavoritesViewProtocol?

    // MARK: - Initialization

    init(view: FavoritesViewProtocol, coordinator: BaseModuleCoordinator) {
        self.view = view
        self.coordinator = coordinator
    }

    // MARK: - Public Methods

    func removeRecipe(at indexPath: IndexPath) {
        recipes?.remove(at: indexPath.row)
    }
}
