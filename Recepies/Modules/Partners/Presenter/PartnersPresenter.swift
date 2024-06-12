// PartnersPresenter.swift
// All rights reserved.

import GoogleMaps

/// Protocol for Partners screen presenter
protocol PartnersPresenterProtocol: AnyObject {
    /// Main initializer
    init(view: PartnersViewProtocol, coordinator: BaseModuleCoordinator)
    /// Acts when cancel button tapping
    func didTapCloseButton()
    /// Acts when location button tapped
    func didTapLocationButton()
    /// Load markers from model and send to view
    func getMarkers()
    /// Initialize opening MapMarlerDetailsView
    func openMarkerDetailsView(for marker: GMSMarker)
}

final class PartnersPresenter: PartnersPresenterProtocol {
    // MARK: - Private Properties

    private weak var coordinator: BaseModuleCoordinator?
    private weak var view: PartnersViewProtocol?
    private var isLocationButtonTapped = false
    private var locations = Location()

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
        let location = locations.getLocation(isIntialLocation: !isLocationButtonTapped)
        view?.moveToLocation(location)
    }

    func getMarkers() {
        let markers = locations.markers
        view?.setMarkers(markers)
    }

    func openMarkerDetailsView(for marker: GMSMarker) {
        guard let profileCoordinator = coordinator as? ProfileCoordinator,
              let mapMarkersDetailsView = profileCoordinator.getMapMarkerDetails() else { return }
        makeMarkerInfoModel(marker) { markerInfo in
            guard let markerInfo else { return }
            mapMarkersDetailsView.configureViewWith(markerInfo)
            self.view?.showMapMarkerDetailsView(mapMarkersDetailsView)
        }
    }

    // MARK: - Privat Methods

    private func makeMarkerInfoModel(_ marker: GMSMarker, handler: @escaping (MarkerInfo?) -> ()) {
        var place: CLPlacemark?
        let geocoder = CLGeocoder()
        let location2D = marker.position
        let location = CLLocation(latitude: location2D.latitude, longitude: location2D.longitude)
        geocoder.reverseGeocodeLocation(location) { places, error in
            place = places?.first
            let markerInfo = MarkerInfo(
                placeName: place?.name,
                adress: place?.thoroughfare,
                discountAmount: Int(marker.snippet ?? "0"),
                promocode: marker.title
            )
            handler(markerInfo)
        }
    }
}
