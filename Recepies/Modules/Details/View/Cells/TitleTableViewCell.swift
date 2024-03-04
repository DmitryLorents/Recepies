// TitleTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Титульная ячека с общей информацией о рецепте
final class TitleTableViewCell: UITableViewCell {
    // MARK: - Constants

    private enum Constants {
        static let veradanaFontBold = "Verdana-Bold"
        static let veradanaFont = "Verdana"
    }

    static let reuseID = String(describing: TitleTableViewCell.self)

    // MARK: - Visual Components

    private let recipeImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.image = .fish1
        return imageView
    }()

    private let recipeNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(name: Constants.veradanaFontBold, size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let weightView: UIView = {
        let view = UIView()
        view.backgroundColor = .currentBlue.withAlphaComponent(0.6)
        view.layer.cornerRadius = 25
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let iconWeightImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = .pot
        return imageView
    }()

    private let textWeightLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: Constants.veradanaFont, size: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let cooKingTimeView: UIView = {
        let view = UIView()
        view.backgroundColor = .currentBlue.withAlphaComponent(0.6)
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        view.layer.cornerRadius = 25
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let iconCooKingTimeImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = .timerCook
        imageView.tintColor = .white
        return imageView
    }()

    private let textCooKingTimeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: Constants.veradanaFont, size: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }

    // MARK: - Life Cycle

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        recipeImage.layer.cornerRadius = recipeImage.bounds.height * 0.08
    }

    // MARK: - Public Methods

    func setupView(recipe: Recipe) {
        recipeNameLabel.text = recipe.name
        textWeightLabel.text = "\(recipe.weight) g"
        textCooKingTimeLabel.text = "Cooking time \(recipe.timeToCook) min"
    }

    // MARK: - Private Methods

    private func configureView() {
        selectionStyle = .none
        weightView.addSubview(iconWeightImage)
        weightView.addSubview(textWeightLabel)
        recipeImage.addSubview(weightView)
        cooKingTimeView.addSubview(iconCooKingTimeImage)
        cooKingTimeView.addSubview(textCooKingTimeLabel)
        recipeImage.addSubview(cooKingTimeView)
        contentView.addSubview(recipeNameLabel)
        contentView.addSubview(recipeImage)
        addConstraintCell()
    }

    private func addConstraintCell() {
        setNameRecipeLabelConstraint()
        configureRecipeImage()
        setWeightViewConstraint()
        setIconWeightImageConstraint()
        setTextWeightLabelConstraint()
        setCooKingTimeViewConstraint()
        setIconCooKingTimeImageConstraint()
        setTextCooKingTimeLabelConstraint()
    }

    private func setNameRecipeLabelConstraint() {
        NSLayoutConstraint.activate([
            recipeNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            recipeNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            recipeNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
        ])
    }

    private func configureRecipeImage() {
        NSLayoutConstraint.activate([
            recipeImage.topAnchor.constraint(equalTo: recipeNameLabel.bottomAnchor, constant: 20),
            recipeImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 45),
            recipeImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -45),
            recipeImage.heightAnchor.constraint(equalTo: recipeImage.widthAnchor),
            recipeImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }

    private func setWeightViewConstraint() {
        NSLayoutConstraint.activate([
            weightView.topAnchor.constraint(equalTo: recipeImage.topAnchor, constant: 8),
            weightView.trailingAnchor.constraint(equalTo: recipeImage.trailingAnchor, constant: -8),
            weightView.widthAnchor.constraint(equalToConstant: 50),
            weightView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    private func setIconWeightImageConstraint() {
        NSLayoutConstraint.activate([
            iconWeightImage.topAnchor.constraint(equalTo: weightView.topAnchor, constant: 11),
            iconWeightImage.centerXAnchor.constraint(equalTo: weightView.centerXAnchor),
            iconWeightImage.widthAnchor.constraint(equalToConstant: 20),
            iconWeightImage.heightAnchor.constraint(equalToConstant: 15)
        ])
    }

    private func setTextWeightLabelConstraint() {
        NSLayoutConstraint.activate([
            textWeightLabel.topAnchor.constraint(equalTo: iconWeightImage.bottomAnchor, constant: 4),
            textWeightLabel.centerXAnchor.constraint(equalTo: weightView.centerXAnchor),
//            iconWeightImage.widthAnchor.constraint(equalToConstant: 20),
//            iconWeightImage.heightAnchor.constraint(equalToConstant: 20)
        ])
    }

    private func setCooKingTimeViewConstraint() {
        NSLayoutConstraint.activate([
            cooKingTimeView.bottomAnchor.constraint(equalTo: recipeImage.bottomAnchor),
            cooKingTimeView.trailingAnchor.constraint(equalTo: recipeImage.trailingAnchor),
            cooKingTimeView.widthAnchor.constraint(equalToConstant: 125),
            cooKingTimeView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    private func setIconCooKingTimeImageConstraint() {
        NSLayoutConstraint.activate([
            iconCooKingTimeImage.leadingAnchor.constraint(equalTo: cooKingTimeView.leadingAnchor, constant: 11),
            iconCooKingTimeImage.centerYAnchor.constraint(equalTo: cooKingTimeView.centerYAnchor),
            iconCooKingTimeImage.widthAnchor.constraint(equalToConstant: 20),
            iconCooKingTimeImage.heightAnchor.constraint(equalToConstant: 20)
        ])
    }

    private func setTextCooKingTimeLabelConstraint() {
        NSLayoutConstraint.activate([
            textCooKingTimeLabel.topAnchor.constraint(equalTo: cooKingTimeView.topAnchor, constant: 10),
            textCooKingTimeLabel.leadingAnchor.constraint(equalTo: iconCooKingTimeImage.trailingAnchor, constant: 5),
            textCooKingTimeLabel.widthAnchor.constraint(equalToConstant: 83),
            textCooKingTimeLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
