// ErrorView.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import UIKit

final class ErrorView: UIView {
    // MARK: - Constants

    private enum Constants {
        static let refreshText = "Reload"
    }

    // MARK: - Vizual components

    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.addArrangedSubview(grayView)
        stack.addArrangedSubview(nothingLabel)
        stack.addArrangedSubview(refreshButton)
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .equalSpacing
        stack.spacing = 17
        return stack
    }()

    private let grayView: UIView = {
        let view = UIView()
        view.backgroundColor = .searchBackground
        view.layer.cornerRadius = 12
        return view
    }()

    private let iconImageView = UIImageView()

    private let nothingLabel: UILabel = {
        let label = UILabel()
        label.font = .makeVerdanaRegular(size: 14)
        label.textAlignment = .center
        return label
    }()

    private lazy var refreshButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.refreshText, for: .normal)
        button.backgroundColor = .searchBackground
        button.semanticContentAttribute = .forceLeftToRight
        button.titleLabel?.font = .makeVerdanaRegular(size: 14)
        button.setTitleColor(.gray, for: .normal)
        button.setImage(.refresh, for: .normal)
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Initialization

    convenience init(state: CategoryState, action: Selector) {
        self.init()
        setupView(action: action)
        updateState(state)
    }

//    private func configureView(state: CategoryState) {
//        switch state {
//        case .noData:
//            refreshButton.isHidden = true
//            iconImageView.image = .search
//            nothingLabel.text = "Start typing text"
//        default:
//            iconImageView.image = .lightning
//            nothingLabel.text = "Failed to load data"
//        }
//    }

    // MARK: - Public Methods

    func updateState(_ state: CategoryState) {
        switch state {
        case .noData:
            refreshButton.isHidden = true
            iconImageView.image = .search
            nothingLabel.text = "Start typing text"
        default:
            refreshButton.isHidden = false
            iconImageView.image = .lightning
            nothingLabel.text = "Failed to load data"
        }
    }

    // MARK: - Private Methods

    private func setupView(action: Selector) {
        backgroundColor = .systemBackground
        refreshButton.addTarget(self, action: action, for: .touchUpInside)
        addSubview(stackView)
        disableTARMIC()
        grayView.addSubview(iconImageView)
        grayView.disableTARMIC()
        setupConstraints()
    }

    // MARK: - Constraints

    func setupConstraints() {
        setupStackViewConstraints()
        setupGrayViewConstraints()
        setupFavoriteImageViewConstraints()
    }

    func setupStackViewConstraints() {
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            refreshButton.heightAnchor.constraint(equalToConstant: 32),
            refreshButton.widthAnchor.constraint(equalToConstant: 150)
        ])
    }

    func setupGrayViewConstraints() {
        NSLayoutConstraint.activate([
            grayView.heightAnchor.constraint(equalToConstant: 50),
            grayView.widthAnchor.constraint(equalTo: grayView.heightAnchor),
        ])
    }

    func setupFavoriteImageViewConstraints() {
        NSLayoutConstraint.activate([
            iconImageView.heightAnchor.constraint(equalToConstant: 24),
            iconImageView.widthAnchor.constraint(equalTo: iconImageView.heightAnchor),
            iconImageView.centerXAnchor.constraint(equalTo: grayView.centerXAnchor),
            iconImageView.centerYAnchor.constraint(equalTo: grayView.centerYAnchor),
        ])
    }
}
