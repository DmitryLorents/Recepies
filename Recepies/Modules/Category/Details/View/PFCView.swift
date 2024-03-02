// PFCView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// View to show PFC detailed information
final class PFCView: UIView {
    // MARK: - Visual Components

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .makeVerdanaRegular(size: 14)
        label.textColor = .white
        label.textAlignment = .center
        label.text = title
        return label
    }()

    // MARK: - Private Properties

    private let title: String
    private let subtitle: String
    private let color: UIColor

    // MARK: - Initializers

    init(title: String, subtitle: String, color: UIColor = .currentBlue) {
        self.title = title
        self.subtitle = subtitle
        self.color = color
        super.init(frame: .zero)
        configureView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        title = "title"
        subtitle = "subtitle"
        color = .gray
        super.init(coder: coder)
    }

    // MARK: - Private Methods

    private func configureView() {
        layer.cornerRadius = 16
    }
}
