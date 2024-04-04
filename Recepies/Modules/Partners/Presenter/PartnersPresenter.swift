// PartnersPresenter.swift
// Copyright © RoadMap. All rights reserved.

/// Protocol for Partners screen presenter
protocol PartnersPresenterProtocol: AnyObject {
    /// Main initializer
    init(view: PartnersViewProtocol, coordinator: BaseModuleCoordinator)
}

final class PartnersPresenter: PartnersPresenterProtocol {
    // MARK: - Private Properties

    private weak var coordinator: BaseModuleCoordinator?
    private weak var view: PartnersViewProtocol?

    // MARK: - Initialization

    init(view: PartnersViewProtocol, coordinator: BaseModuleCoordinator) {
        self.view = view
        self.coordinator = coordinator
    }

    // MARK: - Public Methods
}
