// CategoryViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Cell to show short information for recipe
final class CategoryViewCell: UITableViewCell {
    // MARK: - Constants

    static let reuseID = String(describing: CategoryViewCell.self)

    // MARK: - Visual Components

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
        contentView.backgroundColor = .yellow
        setupConstraints()
    }

    private func configureSubview(with recipe: Recipe) {}
}

// MARK: - Constraints

extension CategoryViewCell {
    private func setupConstraints() {
        contentView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
}
