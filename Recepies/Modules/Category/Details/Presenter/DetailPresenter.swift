// DetailPresenter.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Протокол презентера деталей
protocol DetailPresenterProtocol: AnyObject {
    /// Инициализация протокола
    init(view: DetailViewProtocol, coordinator: BaseModuleCoordinator, recipe: Recipe)
    /// Данные о рецепте
    var recipe: Recipe? { get set }
    /// Вернуться на предыдущй контроллер
    func goBack()
    /// Добавить рецепт в избранное
    func addRecipeForFavorites()
}

final class DetailPresenter: DetailPresenterProtocol {
    // MARK: - Public Properties

    var recipe: Recipe?

    // MARK: - Private Properties

    private weak var view: DetailViewProtocol?
    private weak var coordinator: BaseModuleCoordinator?

    // MARK: - Initializers

    init(view: DetailViewProtocol, coordinator: BaseModuleCoordinator, recipe: Recipe) {
        self.view = view
        self.coordinator = coordinator
        self.recipe = recipe
    }

    // MARK: - Public Methods

    func addRecipeForFavorites() {
        view?.setButtonImage()
    }

    func goBack() {
        if let recipesCoordinator = coordinator as? RecipesCoordinator {
            recipesCoordinator.goBack()
        }
    }
}
