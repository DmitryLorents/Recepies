// NetworkService.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Protocol for network service in app
protocol NetworkServiceProtocol {
    /// Try to download requested category
    /// - Parameters:
    /// type: type of category
    /// completion: closure to handle results
    /// - Returns: Category if success, or error in case of failure
    func getCategory(type: CategoryType, completion: @escaping (Result<Category, Error>) -> ())
    /// Try to download requested recipe
    /// - Parameters:
    /// url: recipe url for detailed search
    /// completion: closure to handle results
    /// - Returns: Recipe if success, or error in case of failure
    func getRecipe(url: String, completion: @escaping (Result<Recipe, Error>) -> ())
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
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let self else { return }
            // Try to download data
            guard let downloadedData = data else {
                if let error {
                    completion(.failure(error))
                }
                return
            }
            // Try to decode downloaded data
            do {
                let parsedData = try self.decoder.decode(parseProtocol, from: downloadedData)
                completion(.success(parsedData))
            } catch { completion(.failure(error)) }
        }
        task.resume()
    }
}

// MARK: - NetworkService - NetworkServiceProtocol

extension NetworkService: NetworkServiceProtocol {
    func getCategory(completion: @escaping (Result<Category, Error>) -> ()) {
        let urlString =
            "https://api.edamam.com/api/recipes/v2?type=public&app_id=cb462440&app_key=7e02a24790f9c127571b1a3bad7028d5&q=chicken"
    }

    func getRecipe(url: String, completion: @escaping (Result<Recipe, Error>) -> ()) {}
}
