// NetworkService.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Protocol for network service in app
protocol NetworkServiceProtocol {
    /// Try to download requested category
    /// - Returns: Category if success, or error in case of failure
    func getCategory() -> Result<Category, Error>
    /// Try to download requested recipe
    /// - Returns: Recipe if success, or error in case of failure
    func getRecipe(url: String) -> Result<Recipe, Error>
}

/// Download data from server
final class NetworkService {
    // MARK: - Private Properties

    private let decoder = JSONDecoder()

    // MARK: - Private Methods

    private func getData<T: Codable>(
        urlString: String,
        parseProtocol: T.Type,
        completion: @escaping (Result<T, Error>) -> ()
    ) {
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in

            guard let self else { return }
            guard let downloadedData = data, error == nil else {
                if let error {
                    completion(.failure(error))
                }
                return
            }

            guard let parsedData = try? self.decoder.decode(parseProtocol, from: downloadedData) else {
                completion(.failure(error!))
                return
            }
            completion(.success(parsedData))
        }.resume()
    }
}

// MARK: - NetworkService - NetworkServiceProtocol

extension NetworkService: NetworkServiceProtocol {
    func getCategory() -> Result<Category, Error> {
        <#code#>
    }

    func getRecipe(url: String) -> Result<Recipe, Error> {
        <#code#>
    }
}
