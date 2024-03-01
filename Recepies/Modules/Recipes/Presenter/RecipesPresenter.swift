// RecipesPresenter.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

// Протокол экрана бонусов
protocol RecipesViewProtocol: AnyObject {}
// Протокол для презентера экрана бонусов
protocol RecipesPresenterProtocol: AnyObject {
    /// Инициализация
    init(view: RecipesViewProtocol, coordinator: BaseModuleCoordinator)
    /// Координатор
    var coordinator: BaseModuleCoordinator? { get set }
    /// Данные о рецептах
    var category: [Category] { get set }
    /// Получение индекса выбраной ячейки
    func getIndex(index: Int)
}

final class RecipesPresenter: RecipesPresenterProtocol {
    // MARK: - Public Properties

    var category: [Category] = Category.makeCategory()

    // MARK: - Private Properties

    private weak var view: RecipesViewProtocol?
    weak var coordinator: BaseModuleCoordinator?

    // MARK: - Initializers

    init(view: RecipesViewProtocol, coordinator: BaseModuleCoordinator) {
        self.view = view
        self.coordinator = coordinator
    }

    // MARK: - Public Methods

    func getIndex(index: Int) {
        let selectedCategory = category[index]
        if let recipesCoordinator = coordinator as? RecipesCoordinator {
            recipesCoordinator.showCategoryScren(category: selectedCategory)
        }
    }
}
