// Proxy.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Protocol for image loading service
protocol LoadImageServiceProtocol {
    /// Provide UIImage by url
    /// - Parameter stringURL: url adress of image in string format
    /// - Returns requested image
    func loadImage(by urlString: String, completion: @escaping (Result<UIImage, Error>) -> ())
}

/// Load images from network or from cashe if existed
final class Proxy: LoadImageServiceProtocol {
    // MARK: - Private Properties

    private let service: LoadImageServiceProtocol

    // MARK: - Initialization

    init(service: LoadImageServiceProtocol) {
        self.service = service
    }

    func loadImage(by urlString: String, completion: @escaping (Result<UIImage, Error>) -> ()) {
        if false {
        } else {
            service.loadImage(by: urlString) { result in
                switch result {
                case let .failure(error):
                    completion(.failure(error))
                case let .success(image):
                    // save image to cashe
                    completion(.success(image))
                }
            }
        }
    }
}
