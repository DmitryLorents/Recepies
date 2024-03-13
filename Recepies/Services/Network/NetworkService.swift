// NetworkService.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Protocol for network service in app
protocol NetworkServiceProtocol {
    /// Init with service to create url requests
    init(requestCreator: RequestCreatorProtocol)

    /// Try to download requested recipes
    /// - Parameters:
    /// type: type of category
    /// completion: closure to handle results
    /// - Returns: Array of recipes if success, or error in case of failure
    func getRecipes(type: CategoryType, text: String, completion: @escaping (Result<[Recipe], Error>) -> ())

    /// Try to download requested recipe
    /// - Parameters:
    /// url: recipe url for detailed search
    /// completion: closure to handle results
    /// - Returns: Recipe if success, or error in case of failure
    func getRecipe(url: String, completion: @escaping (Result<RecipeDetail, Error>) -> ())
}

/// Download data from server
final class NetworkService {
    // MARK: - Private Properties

    private let decoder = JSONDecoder()
    private var requestCreator: RequestCreatorProtocol

    // MARK: - Initialization

    init(requestCreator: RequestCreatorProtocol) {
        self.requestCreator = requestCreator
    }

    // MARK: - Private Methods

    private func convertToRecipes(_ categoryDTO: CategoryDTO) -> [Recipe] {
        categoryDTO.hits.map { Recipe($0.recipe) }
    }

    private func getData<T: Codable>(
        request: URLRequest?,
        parseProtocol: T.Type,
        completion: @escaping (Result<T, Error>) -> ()
    ) {
        guard let request else { return }
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, _, error in
            guard let self else { return }
            guard let downloadedData = data else {
                if let error {
                    completion(.failure(error))
                }
                return
            }
            do {
                let parsedData = try self.decoder.decode(parseProtocol, from: downloadedData)
                completion(.success(parsedData))
            } catch { 
                completion(.failure(error)) }
        }
        task.resume()
    }
}

// MARK: - NetworkService - NetworkServiceProtocol

extension NetworkService: NetworkServiceProtocol {
    func getRecipes(type: CategoryType, text: String, completion: @escaping (Result<[Recipe], Error>) -> ()) {
        let request = requestCreator.createCategoryURLRequest(type: type, text: text)
        getData(request: request, parseProtocol: CategoryDTO.self) { result in
            switch result {
            case let .success(categoryDTO):
                let recipes = self.convertToRecipes(categoryDTO)
                completion(.success(recipes))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }

    func getRecipe(url: String, completion: @escaping (Result<RecipeDetail, Error>) -> ()) {
        let request = requestCreator.createRecipeURLRequest(uri: url)
        getData(request: request, parseProtocol: RecipeDTOContainer.self) { result in
            switch result {
            case let .success(recipe):
                completion(.success(RecipeDetail(dto: recipe.recipe)))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
