// UIImageView+Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

extension UIImageView {
    func imageFromURL(_ URLString: String) {
        image = nil
        // If imageurl's imagename has space then this line going to work for this
        let imageServerUrl = URLString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""

        if let url = URL(string: imageServerUrl) {
            URLSession.shared.dataTask(with: url, completionHandler: { data, _, error in

                if error != nil {
                    DispatchQueue.main.async {
                        print("Set default photo")
                        let image = UIImage(systemName: "photo")?.withRenderingMode(.alwaysOriginal)
                            .withTintColor(.gray)
                        self.image = image
                    }
                    return
                }
                DispatchQueue.main.async {
                    if let data = data {
                        print("Set downloaded photo")
                        if let downloadedImage = UIImage(data: data) {
                            self.image = downloadedImage
                        }
                    }
                }
            }).resume()
        }
    }
}
