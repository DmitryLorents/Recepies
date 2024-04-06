// PartnersView.swift
// Copyright © RoadMap. All rights reserved.

import GoogleMaps
import UIKit

/// Protocol for Partners view
protocol PartnersViewProtocol: AnyObject {
    /// View's presenter
    var presenter: PartnersPresenterProtocol? { get set }
    /// Change button's image
    /// - Parameter isTapped: indicates wheter button is tapped or not
    func setLocationButtonTapped(_ isTapped: Bool)
    /// Moves map to new location
    ///  - Parameter location: new location where to move
    func moveToLocation(_ location: CLLocationCoordinate2D)
    /// Set markers on map
    ///  - Parameter markers: array of markers
    func setMarkers(_ markers: [GMSMarker])
    /// Open detends sheet with marker detaile information
    /// - Parameter view: prepared and builed view to show
    func showMapMarkerDetailsView(_ view: MapMarkerDetailsView)
}

/// View to show authorization screen
final class PartnersView: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let title = "Our Partners"
        static let okButtonTitle = "Ok"
        static let offerLabelText = "You can get gifts and discounts from our partners"
    }

    // MARK: - Visual components

    private lazy var okButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.layer.cornerRadius = 12
        button.setTitle(Constants.okButtonTitle, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .makeVerdanaRegular(size: 16)
        button.addTarget(nil, action: #selector(okButtonAction), for: .touchUpInside)
        return button
    }()

    private let offerLabel: UILabel = {
        let label = UILabel()
        label.font = .makeVerdanaRegular(size: 18)
        label.text = Constants.offerLabelText
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()

    private lazy var mapView: GMSMapView = {
        let view = GMSMapView()
        let coordinate = CLLocationCoordinate2D(latitude: 55.753215, longitude: 37.622504)
        let camera = GMSCameraPosition.camera(withTarget: coordinate, zoom: 13)
        view.camera = camera
        view.delegate = self
        return view
    }()

    private lazy var locationButton: UIButton = {
        let button = UIButton()
        button.setImage(.locator, for: .normal)
        button.backgroundColor = .white
        button.addTarget(nil, action: #selector(locationButtonAction), for: .touchUpInside)
        button.layer.cornerRadius = 52.0 / 2
        return button
    }()

    // MARK: - Public Properties

    var presenter: PartnersPresenterProtocol?

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupVIew()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter?.getMarkers()
    }

    // MARK: - Private Methods

    private func setupVIew() {
        view.backgroundColor = .systemBackground
        title = Constants.title
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapOnView))
        view.addGestureRecognizer(tapGesture)
        view.addSubviews(mapView, locationButton, offerLabel, okButton)
        view.disableTARMIC()
        setupConstraints()
        setupNavigationAppearance()
    }

    private func setupNavigationAppearance() {
        hideBackButton()
        addCloseButton()
    }

    private func hideBackButton() {
        navigationItem.setHidesBackButton(true, animated: true)
    }

    private func addCloseButton() {
        let closeButton = UIButton()
        closeButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        closeButton.tintColor = .black
        closeButton.addTarget(self, action: #selector(closeButtonAction), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: closeButton)
    }

    @objc private func okButtonAction() {
        presenter?.didTapCloseButton()
    }

    @objc private func locationButtonAction() {
        presenter?.didTapLocationButton()
    }

    @objc private func tapOnView() {
        print(#function)
    }

    @objc func closeButtonAction() {
        presenter?.didTapCloseButton()
    }
}

// MARK: - PartnersView - PartnersViewProtocol

extension PartnersView: PartnersViewProtocol {
    func setLocationButtonTapped(_ isTapped: Bool) {
        let image: UIImage = isTapped ? .locatorFill : .locator
        locationButton.setImage(image, for: .normal)
    }

    func moveToLocation(_ location: CLLocationCoordinate2D) {
        mapView.animate(toLocation: location)
    }

    func setMarkers(_ markers: [GMSMarker]) {
        markers.forEach { $0.map = mapView }
    }

    func showMapMarkerDetailsView(_ view: MapMarkerDetailsView) {
        if let sheet = view.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.preferredCornerRadius = 30
        }
        present(view, animated: true)
    }
}

// MARK: - PartnersView - GMSMapViewDelegate

extension PartnersView: GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        print(coordinate)
    }

    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        print(#function)
        presenter?.openMarkerDetailsView()
        return true
    }
}

// MARK: - Constraints

private extension PartnersView {
    func setupConstraints() {
        setupOkButtonConstraints()
        setupOfferLabelConstraints()
        setupStubViewConstraints()
        setupLocationButtonConstraints()
    }

    func setupOkButtonConstraints() {
        NSLayoutConstraint.activate([
            okButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            okButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            okButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -53),
            okButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }

    func setupOfferLabelConstraints() {
        NSLayoutConstraint.activate([
            offerLabel.leadingAnchor.constraint(equalTo: okButton.leadingAnchor),
            offerLabel.trailingAnchor.constraint(equalTo: okButton.trailingAnchor),
            offerLabel.bottomAnchor.constraint(equalTo: okButton.topAnchor, constant: -60)
        ])
    }

    func setupStubViewConstraints() {
        NSLayoutConstraint.activate([
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            mapView.bottomAnchor.constraint(equalTo: offerLabel.topAnchor, constant: -40)
        ])
    }

    func setupLocationButtonConstraints() {
        NSLayoutConstraint.activate([
            locationButton.heightAnchor.constraint(equalToConstant: 52),
            locationButton.widthAnchor.constraint(equalTo: locationButton.heightAnchor),
            locationButton.trailingAnchor.constraint(equalTo: mapView.trailingAnchor, constant: -14),
            locationButton.bottomAnchor.constraint(equalTo: mapView.bottomAnchor, constant: -14),
        ])
    }
}
