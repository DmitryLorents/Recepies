// PFCViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Cell to show PFC recipe information
final class PFCViewCell: UITableViewCell {
    // MARK: - Constants

    private enum Constants {
        static let kkalTitle = "Enerc kcal"
        static let carbohydrates = "Carbohydrates"
        static let fats = "Fats"
        static let proteins = "Proteins"
        static let gram = " g"
        static let kCal = " kcal"
        static let sideInset = 45.0
    }

    static let reuseID = String(describing: PFCViewCell.self)

    // MARK: - Visual Components

    private let caloriesView = PFCView(title: Constants.kkalTitle)
    private let carbohydratesView = PFCView(title: Constants.carbohydrates)
    private let fatsView = PFCView(title: Constants.fats)
    private let proteinsView = PFCView(title: Constants.proteins)

    private lazy var stackView: UIStackView = {
       let stack = UIStackView(arrangedSubviews: [caloriesView, carbohydratesView, fatsView, proteinsView])
        stack.spacing = 5
        return stack
    }()

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

    // MARK: - Public Methods

    func setupCell(with recipe: Recipe?) {
        self.recipe = recipe
    }

    // MARK: - Private Methods

    private func setupView() {
        contentView.addSubview(stackView)
        contentView.disableTARMIC()
        setupConstraints()
    }

    private func configureSubview(with recipe: Recipe) {
        let caloriesAmount = makeFormattedString(from: recipe.calories)
        caloriesView.set(subtitle: caloriesAmount + Constants.kCal )
        
        let carbohydratesAmount = makeFormattedString(from: recipe.pfc.carbohydrates)
        carbohydratesView.set(subtitle: carbohydratesAmount + Constants.gram)
        
        let fatsAmount = makeFormattedString(from: recipe.pfc.fats)
        carbohydratesView.set(subtitle: fatsAmount + Constants.gram)
        
        let proteinsAmount = makeFormattedString(from: recipe.pfc.proteins)
        carbohydratesView.set(subtitle: proteinsAmount + Constants.gram)
    }
    
    private func makeFormattedString(from double: Double) -> String {
        String(format: "%0.2f", double)
    }
}

// MARK: - Constraints

private extension PFCViewCell {
    func setupConstraints() {
        NSLayoutConstraint.activate([
        stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.sideInset),
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.sideInset),
        stackView.heightAnchor.constraint(equalToConstant: 53),
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])

    }
}
