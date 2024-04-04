// PartnersPresenter.swift
// Copyright © RoadMap. All rights reserved.

/// Protocol for Partners screen presenter
protocol PartnersPresenterProtocol: AnyObject {
    /// Main initializer
    init(view: PartnersViewProtocol, coordinator: BaseModuleCoordinator)
    /// Acts when cancel button tapping
    func didTapCloseButton()
    /// Acts when location button tapped
    func didTapLocationButton()
}

final class PartnersPresenter: PartnersPresenterProtocol {
    // MARK: - Private Properties

    private weak var coordinator: BaseModuleCoordinator?
    private weak var view: PartnersViewProtocol?
    private var isLocationButtonTapped = false

    // MARK: - Initialization

    init(view: PartnersViewProtocol, coordinator: BaseModuleCoordinator) {
        self.view = view
        self.coordinator = coordinator
    }

    // MARK: - Public Methods

    func didTapCloseButton() {
        coordinator?.publicRootController.popViewController(animated: true)
    }

    func didTapLocationButton() {
        isLocationButtonTapped.toggle()
        view?.setLocationButtonTapped(isLocationButtonTapped)
        // Add some location logic
    }
}
