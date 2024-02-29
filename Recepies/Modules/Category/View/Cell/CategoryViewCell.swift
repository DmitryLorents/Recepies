// CategoryViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Cell to show short information for recipe
final class CategoryViewCell: UITableViewCell {
    // MARK: - Constants

    static let reuseID = String(describing: CategoryViewCell.self)

    // MARK: - Visual Components

    private let dishImageView: UIImageView = {
        let imageView = UIImageView(image: .dish)
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        return imageView
    }()

    private let grayBackgroundView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.backgroundColor = .cellBackground
        return view
    }()

    // MARK: - Public Properties

    // MARK: - Private Properties

    private var recipe: Recipe? {
        didSet {
            if let recipe {
                configureSubview(with: recipe)
            }
        }
    }

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    // MARK: - Life Cycle

    // MARK: - Public Methods

    func setupCell(with recipe: Recipe?) {
        self.recipe = recipe
    }

    // MARK: - Private Methods

    private func setupView() {
        contentView.addSubview(grayBackgroundView)
        contentView.disableTARMIC()
        grayBackgroundView.addSubviews(dishImageView)
        grayBackgroundView.disableTARMIC()
        setupConstraints()
    }

    private func configureSubview(with recipe: Recipe) {}
}

// MARK: - Constraints

private extension CategoryViewCell {
    func setupConstraints() {
        setupGrayBackgroundViewConstraints()
        setupDishImageViewConstraints()
    }

    func setupGrayBackgroundViewConstraints() {
        NSLayoutConstraint.activate([
            grayBackgroundView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            grayBackgroundView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            grayBackgroundView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 7),
            grayBackgroundView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -7),
        ])
    }

    func setupDishImageViewConstraints() {
        NSLayoutConstraint.activate([
            dishImageView.leadingAnchor.constraint(equalTo: grayBackgroundView.leadingAnchor, constant: 10),
            dishImageView.topAnchor.constraint(equalTo: grayBackgroundView.topAnchor, constant: 10),
            dishImageView.bottomAnchor.constraint(equalTo: grayBackgroundView.bottomAnchor, constant: -10),
            dishImageView.heightAnchor.constraint(equalToConstant: 80),
            dishImageView.widthAnchor.constraint(equalTo: dishImageView.widthAnchor),
        ])
    }
}
