// PartnersView.swift
// Copyright © RoadMap. All rights reserved.

import GoogleMaps
import UIKit

/// Protocol for Partners view
protocol PartnersViewProtocol: AnyObject {
    /// View's presenter
    var presenter: PartnersPresenterProtocol? { get set }
    /// Change button's image
    /// - Parameter image: image for button
    func setLocationButtonImage(_ image: UIImage)
    //    /// Notify user if password format is incorrect
    //    /// - Parameter decision: defines necessity to notify the user
    //    func showIncorrectPasswordFormat(_ decision: Bool)
    //    /// Notify user if email or password are not valid
    //    /// - Parameter decision: defines necessity to notify the user
    //    func showIncorrectUserData(_ decision: Bool)
    //    /// Set password textField in secure/nonsecure mode
    //    /// - Parameter decision: defines necessity to set secure
    //    func setPasswordSecured(isSecured: Bool)
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

    private let stubView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
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

    // MARK: - Private Methods

    private func setupVIew() {
        view.backgroundColor = .systemBackground
        title = Constants.title
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapOnView))
        view.addGestureRecognizer(tapGesture)
        view.addSubviews(stubView, locationButton, offerLabel, okButton)
        view.disableTARMIC()
        setupConstraints()
    }

    @objc private func okButtonAction() {
        print(#function)
    }

    @objc private func locationButtonAction() {
        print(#function)
    }

    @objc private func tapOnView() {
        print(#function)
    }
}

// MARK: - PartnersView - PartnersViewProtocol

extension PartnersView: PartnersViewProtocol {
    func setLocationButtonImage(_ image: UIImage) {
        locationButton.setImage(image, for: .normal)
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
            stubView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stubView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stubView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stubView.bottomAnchor.constraint(equalTo: offerLabel.topAnchor, constant: -40)
        ])
    }

    func setupLocationButtonConstraints() {
        NSLayoutConstraint.activate([
            locationButton.heightAnchor.constraint(equalToConstant: 52),
            locationButton.widthAnchor.constraint(equalTo: locationButton.heightAnchor),
            locationButton.trailingAnchor.constraint(equalTo: stubView.trailingAnchor, constant: -14),
            locationButton.bottomAnchor.constraint(equalTo: stubView.bottomAnchor, constant: -14),
        ])
    }
}
