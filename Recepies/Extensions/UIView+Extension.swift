// UIView+Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Adding useful functions to UIVIew
extension UIView {
    /// Function to add several subviews separated by comma
    ///  - Parameter subviews: all the subviews added to general view
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach { self.addSubview($0) }
    }

    /// Disable translatesAutoresizingMaskIntoConstraints for all subviews
    func disableTARMIC() {
        subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    }

    /// Add shimmer effect to view
    func startShimmeringAnimation() {
        let lightColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.5).cgColor
        let blackColor = UIColor.black.cgColor
        let animationSpeed = 1.0

        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [blackColor, lightColor, blackColor]
        gradientLayer.frame = CGRect(
            x: -bounds.size.width,
            y: -bounds.size.height,
            width: 3 * bounds.size.width,
            height: 3 * bounds.size.height
        )

        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.locations = [0.35, 0.50, 0.65]

        let grayShimmerLayer = CALayer()
        grayShimmerLayer.backgroundColor = UIColor.systemGray4.cgColor
        grayShimmerLayer.frame = bounds
        grayShimmerLayer.cornerRadius = grayShimmerLayer.frame.height > 60 ? 12 : grayShimmerLayer.frame.height / 5
        grayShimmerLayer.masksToBounds = true
        layer.addSublayer(grayShimmerLayer)
        layer.mask = gradientLayer

        CATransaction.begin()
        let animation = CABasicAnimation(keyPath: "locations")
        animation.fromValue = [0.0, 0.1, 0.2]
        animation.toValue = [0.8, 0.9, 1.0]
        animation.duration = CFTimeInterval(animationSpeed)
        animation.repeatCount = .infinity
        CATransaction.setCompletionBlock { [weak self] in
            guard let self = self else { return }
            self.layer.mask = nil
            grayShimmerLayer.removeFromSuperlayer()
        }
        gradientLayer.add(animation, forKey: "shimmerAnimation")
        CATransaction.commit()
    }

    func stopShimmeringAnimation() {
        layer.mask = nil
        layer.sublayers?.first?.removeFromSuperlayer()
    }
}
