// RecepiesPresenter.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

// Протокол экрана бонусов
protocol RecepiesViewProtocol: AnyObject {}
// Протокол для презентера экрана бонусов
protocol RecepiesPresenterProtocol: AnyObject {
    /// Инициализация
    init(view: RecepiesViewProtocol, coordinator: BaseModuleCoordinator)
    /// Координатор
    var coordinator: BaseModuleCoordinator? { get set }
    /// Данные о рецептах
    var category: [Category] { get set }
    /// Получение индекса выбраной ячейки
    func getIndex(index: Int)
}

final class RecepiesPresenter: RecepiesPresenterProtocol {
    // MARK: - Public Properties

    var category: [Category] = Category.makeCategory()

    // MARK: - Private Properties

    private weak var view: RecepiesViewProtocol?
    weak var coordinator: BaseModuleCoordinator?

    // MARK: - Initializers

    init(view: RecepiesViewProtocol, coordinator: BaseModuleCoordinator) {
        self.view = view
        self.coordinator = coordinator
    }

    // MARK: - Public Methods

    func getIndex(index: Int) {
        let selectedCategory = category[index]
        if let recepiesCoordinator = coordinator as? RecipesCoordinator {
            recepiesCoordinator.showCategoryScren(category: selectedCategory)
        }
    }
}
