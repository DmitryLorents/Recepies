// DetailView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

final class DetailView: UIViewController {
    var presenter: DetailPresenter?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension DetailView: DetailViewProtocol {}
