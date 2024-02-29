// MainTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка с автаркой и именем пользователя
final class MainTableViewCell: UITableViewCell {
    // MARK: - Constants

    private enum Constans {
        static let fullNameLabelFont = "Verdana-Bold"
        static let editNameButtonImage = "ipensela"
    }

    // MARK: - Visual Components

    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let fullName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: Constans.fullNameLabelFont, size: 25)
        label.textAlignment = .center
        return label
    }()

    private lazy var editNameButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Constans.editNameButtonImage), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .black
        button.addTarget(self, action: #selector(editLabel), for: .touchUpInside)
        return button
    }()

    // MARK: - Public Properties

    var editNameHandler: VoidHandler?

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addItemCell()
        setConstraint()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addItemCell()
        setConstraint()
    }

    // MARK: - Public Methods

    func setupCell(profile: ProfileUserProtocol) {
        avatarImageView.image = UIImage(named: profile.avatarImage)
        fullName.text = profile.userName
    }

    // MARK: - Private Methods

    private func addItemCell() {
        selectionStyle = .none
        contentView.addSubview(avatarImageView)
        contentView.addSubview(fullName)
        contentView.addSubview(editNameButton)
    }

    private func setConstraint() {
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 36),
            avatarImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            avatarImageView.heightAnchor.constraint(equalToConstant: 160),
            avatarImageView.widthAnchor.constraint(equalToConstant: 160),

            fullName.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 36),
            fullName.centerXAnchor.constraint(equalTo: centerXAnchor),
            fullName.heightAnchor.constraint(equalToConstant: 30),
            fullName.widthAnchor.constraint(equalToConstant: 256),
            fullName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),

            editNameButton.leadingAnchor.constraint(equalTo: fullName.trailingAnchor, constant: 11),
            editNameButton.centerYAnchor.constraint(equalTo: fullName.centerYAnchor),
            editNameButton.heightAnchor.constraint(equalToConstant: 18),
            editNameButton.widthAnchor.constraint(equalToConstant: 18),

        ])
    }

    @objc private func editLabel() {
        editNameHandler?()
    }
}
