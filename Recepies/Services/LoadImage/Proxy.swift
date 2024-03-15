// Proxy.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Protocol for image loading service
protocol LoadImageServiceProtocol {
    /// Provide UIImage by url
    /// - Parameter stringURL: url adress of image in string format
    /// - Returns requested image
    func loadImage(by urlString: String) -> UIImage?
}

final class Proxy: LoadImageServiceProtocol {
    func loadImage(by urlString: String) -> UIImage? {
        <#code#>
    }
}
