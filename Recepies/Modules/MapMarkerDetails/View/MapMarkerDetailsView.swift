// MapMarkerDetailsView.swift
// All rights reserved.

import UIKit

/// Protocol for MapMarkerDetailsView
protocol MapMarkerDetailsViewProtocol: AnyObject {
    /// Module presenter
    var presenter: MapMarkerDetailsPresenterProtocol? { get set }
    /// Call to close the screen
    func closeView()
    /// Configure view's labels
    func configureViewWith(_ model: MarkerInfo)
}

/// Screen with number of shoes
final class MapMarkerDetailsView: UIViewController {
    // MARK: - Constants

    private enum Constans {
        static let cancelButtonImage = "xmark"
        static let bonuslabelText = "Your bonuses"
        static let discountText = "Your discount "
        static let percentMark = "%"
        static let minusMark = "-"
        static let promocode = "Promocode "
    }

    // MARK: - Visual Components

    private let placeNameLabel: UILabel = {
        let label = UILabel()
        label.font = .makeVerdanaBold(size: 20)
        label.text = "Constans.bonuslabelText"
        label.textAlignment = .center
        label.textColor = .darkGray
        return label
    }()

    private let adressLabel: UILabel = {
        let label = UILabel()
        label.font = .makeVerdanaRegular(size: 20)
        label.textAlignment = .center
        label.text = "Constans.countBonusLabelText"
        label.textColor = .darkGray
        return label
    }()

    private let promocodeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = "Some text\n\n Some more text"
        return label
    }()

    private lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: Constans.cancelButtonImage), for: .normal)
        button.tintColor = .darkGray
        button.addTarget(self, action: #selector(cancelButtonAction), for: .touchUpInside)
        return button
    }()

    // MARK: - Public Properties

    var presenter: MapMarkerDetailsPresenterProtocol?

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setConstraint()
    }

    // MARK: - Private Methods

    private func setupView() {
        view.backgroundColor = .white
        view.addSubviews(cancelButton, placeNameLabel, adressLabel, promocodeLabel)
        view.disableTARMIC()
    }

    private func makePromoText(_ model: MarkerInfo) -> NSAttributedString {
        let discountString =
            "\(Constans.discountText)\(Constans.minusMark)\(model.discountAmount)\(Constans.percentMark)\n\n\(Constans.promocode)"
        let baseAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.makeVerdanaRegular(size: 16) as Any]
        let discountText = NSMutableAttributedString(string: discountString, attributes: baseAttributes)
        let boldAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.makeVerdanaBold(size: 16) as Any]
        let promocodeValueText = NSAttributedString(string: model.promocode, attributes: boldAttributes)
        discountText.append(promocodeValueText)
        return discountText
    }

    @objc private func cancelButtonAction() {
        presenter?.dismisView()
    }
}

// MARK: - MapMarkerDetailsView + MapMarkerDetailsViewProtocol

extension MapMarkerDetailsView: MapMarkerDetailsViewProtocol {
    func closeView() {
        dismiss(animated: true)
    }

    func configureViewWith(_ model: MarkerInfo) {
        placeNameLabel.text = model.placeName
        adressLabel.text = model.adress
        promocodeLabel.attributedText = makePromoText(model)
    }
}

// MARK: - Constraints

private extension MapMarkerDetailsView {
    func setConstraint() {
        placeNameLabelConstraints()
        cancelButtonConstraints()
        adressLabelConstraints()
        promocodeLabelConstraints()
    }

    func placeNameLabelConstraints() {
        NSLayoutConstraint.activate([
            placeNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 49),
            placeNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            placeNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }

    func cancelButtonConstraints() {
        NSLayoutConstraint.activate([
            cancelButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            cancelButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            cancelButton.heightAnchor.constraint(equalToConstant: 30),
            cancelButton.widthAnchor.constraint(equalToConstant: 30),
        ])
    }

    func adressLabelConstraints() {
        NSLayoutConstraint.activate([
            adressLabel.topAnchor.constraint(equalTo: placeNameLabel.bottomAnchor, constant: 8),
            adressLabel.leadingAnchor.constraint(equalTo: placeNameLabel.leadingAnchor),
            adressLabel.trailingAnchor.constraint(equalTo: placeNameLabel.trailingAnchor),
        ])
    }

    func promocodeLabelConstraints() {
        NSLayoutConstraint.activate([
            promocodeLabel.topAnchor.constraint(equalTo: adressLabel.bottomAnchor, constant: 43),
            promocodeLabel.leadingAnchor.constraint(equalTo: placeNameLabel.leadingAnchor),
            promocodeLabel.trailingAnchor.constraint(equalTo: placeNameLabel.trailingAnchor),
        ])
    }
}
