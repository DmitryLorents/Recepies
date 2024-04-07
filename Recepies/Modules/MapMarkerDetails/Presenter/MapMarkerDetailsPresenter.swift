// MapMarkerDetailsPresenter.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

///  Protocol for bonus screen presenter
protocol MapMarkerDetailsPresenterProtocol: AnyObject {
    /// General init
    init(view: MapMarkerDetailsViewProtocol)
    /// Closing the bonus screen
    func dismisView()
}

final class MapMarkerDetailsPresenter: MapMarkerDetailsPresenterProtocol {
    // MARK: - Public Properties

    weak var view: MapMarkerDetailsViewProtocol?

    // MARK: - Initialization

    init(view: MapMarkerDetailsViewProtocol) {
        self.view = view
    }

    // MARK: - Public Methods

    func dismisView() {
        view?.closeView()
    }
}
