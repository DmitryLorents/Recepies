// ErrorView.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import UIKit

final class ErrorView: UIView {
    private enum Constants {
        static let refreshText = "ref"
    }

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
//        label.text = Constants.nothingText
        label.font = .makeVerdanaRegular(size: 14)
        label.textAlignment = .center
        return label
    }()

    private lazy var refreshButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.refreshText, for: .normal)
        button.backgroundColor = .lightGray
        button.semanticContentAttribute = .forceLeftToRight
        button.titleLabel?.font = .makeVerdanaRegular(size: 14)
        button.setTitleColor(.gray, for: .normal)
        button.setImage(.refresh, for: .normal)
        button.layer.cornerRadius = 12
        return button
    }()

    // MARK: - Public Properties

    convenience init(state: CategoryState) {
        self.init()
        configureView(state: state)
        setupView()
    }

    private func configureView(state: CategoryState) {
        switch state {
        case .noData:
            refreshButton.isHidden = true
            iconImageView.image = .search
            nothingLabel.text = "Start typing text"
        default:
            iconImageView.image = .lightning
            nothingLabel.text = "Failed to load data"
        }
    }

    // MARK: - Private Methods

    private func setupView() {
        backgroundColor = .systemBackground
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
