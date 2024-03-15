// NetworkService.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

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
    func getDetailedRecipe(url: String, completion: @escaping (Result<RecipeDetail, Error>) -> ())
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

    func getDetailedRecipe(url: String, completion: @escaping (Result<RecipeDetail, Error>) -> ()) {
        let request = requestCreator.createRecipeURLRequest(uri: url)
        getData(request: request, parseProtocol: RecipeDetailResponseDTO.self) { result in
            switch result {
            case let .success(recipe):
                guard let detailDto = recipe.hits.first else { return }

                completion(.success(RecipeDetail(dto: detailDto.recipe)))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}

// MARK: - NetworkService - LoadImageServiceProtocol

extension NetworkService: LoadImageServiceProtocol {
    func loadImage(by urlString: String, completion: @escaping (Result<UIImage, Error>) -> ()) {
        guard let url = URL(string: urlString) else {
            print("Failed to create URL")
            return
        }
        let configuration = URLSessionConfiguration.default
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        configuration.urlCache = nil
        let session = URLSession(configuration: configuration)
        let task = session.dataTask(with: URLRequest(url: url)) { data, _, error in
            if let data, let image = UIImage(data: data) {
                completion(.success(image))
            } else if let error {
                completion(.failure(error))
            }
        }
        task.resume()
//        var outputImage: UIImage = .init()
//        DispatchQueue.global().async {
//            if let url = URL(string: urlString),
//               let data = try? Data(contentsOf: url),
//               let image = UIImage(data: data)
//            {
//                DispatchQueue.main.async {
//                    outputImage = image
//                }
//            } else {
//                DispatchQueue.main.async {
//                    outputImage = UIImage(systemName: "photo") ?? .init()
//                }
//            }
//        }
//        return outputImage
    }
}
