// RequestCreator.swift
// All rights reserved.

import Foundation

/// Protocol for URL request creation
protocol RequestCreatorProtocol {
    /// Provide URL request for getting recipes by category and search text
    /// - Parameters:
    /// type: type of desired category
    /// text: text from search bar entered by user
    /// - Returns: URL request with necessary parameters
    func createCategoryURLRequest(type: CategoryType, text: String) -> URLRequest?
    /// Provide URL request for getting recipes by category and search text
    /// - Parameters:
    /// uri: Recipe ID
    /// - Returns: URL request with necessary parameters
    func createRecipeURLRequest(uri: String) -> URLRequest?
}

/// Creates URLRequests for NetworkServiceProtocol
final class RequestCreator {
    // MARK: - Constants

    private enum Constants {
        static let sheme = "https"
        static let host = "api.edamam.com"
    }

    // MARK: - Private Methods

    private func makeSearchQuery(_ type: CategoryType, text: String) -> URLQueryItem {
        var searchText: String
        switch type {
        case .chicken, .meat, .fish:
            searchText = "\(type.rawValue.capitalized) \(text)"
        default:
            searchText = text
        }
        return URLQueryItem(name: "q", value: searchText)
    }

    private func makeGeneralQueryItems() -> [URLQueryItem] {
        let typeQuery = URLQueryItem(name: "type", value: "public")
        let appKeyQuery = URLQueryItem(name: "app_key", value: "7e02a24790f9c127571b1a3bad7028d5")
        let appIdQuery = URLQueryItem(name: "app_id", value: "cb462440")
        let imageSizeQuery = URLQueryItem(name: "imageSize", value: "THUMBNAIL")
        return [typeQuery, appKeyQuery, appIdQuery, imageSizeQuery]
    }

    private func makeCategoryQueryItems(type: CategoryType, text: String) -> [URLQueryItem] {
        //        let isRandomQuery = URLQueryItem(name: "random", value: "true")
        let dishTypeQuery = URLQueryItem(name: "dishType", value: type.description)
        let searchQuery = makeSearchQuery(type, text: text)
        let uriQuery = URLQueryItem(name: "field", value: "uri")
        let labelQuery = URLQueryItem(name: "field", value: "label")
        let imageQuery = URLQueryItem(name: "field", value: "image")
        let totalTimeQuery = URLQueryItem(name: "field", value: "totalTime")
        let caloriesQuery = URLQueryItem(name: "field", value: "calories")
        var queries: [URLQueryItem] = makeGeneralQueryItems() + [
            //            isRandomQuery,
            dishTypeQuery,
            searchQuery,
            uriQuery,
            labelQuery,
            imageQuery,
            totalTimeQuery,
            caloriesQuery
        ]
        if type == .sideDish {
            let healthQuery = URLQueryItem(name: "health", value: "vegetarian")
            queries.append(healthQuery)
        }
        return queries
    }

    private func makeRecipeQueryItems(uri: String) -> [URLQueryItem] {
        let uriQuery = URLQueryItem(name: "uri", value: uri)
        return makeGeneralQueryItems() + [uriQuery]
    }

    private func makeMockURL() -> URL? {
        let fileName = "detailRecipeStub"
        let bundleURL = Bundle.main.url(forResource: fileName, withExtension: "json")
        guard let bundleURL else {
            let errorText = "Absence of mock file: \(fileName).json"
            debugPrint(errorText)
            return nil
        }
        return bundleURL
    }
}

// MARK: - RequestCreator - RequestCreatorProtocol

extension RequestCreator: RequestCreatorProtocol {
    func createRecipeURLRequest(uri: String) -> URLRequest? {
        // Check if mock target and replace URL
        #if Mock
        guard let mockURL = makeMockURL() else { return nil }
        return URLRequest(url: mockURL)
        #endif
        // Case not mock target. Return usual url
        var components = URLComponents()
        components.scheme = Constants.sheme
        components.host = Constants.host
        components.path = "/api/recipes/v2/by-uri"
        components.queryItems = makeRecipeQueryItems(uri: uri)
        guard let url = components.url else { return nil }
        print(url)
        return URLRequest(url: url)
    }

    func createCategoryURLRequest(type: CategoryType, text: String) -> URLRequest? {
        var components = URLComponents()
        components.scheme = Constants.sheme
        components.host = Constants.host
        components.path = "/api/recipes/v2"
        components.queryItems = makeCategoryQueryItems(type: type, text: text)
        guard let url = components.url else {
            return nil
        }
        print(url)
        return URLRequest(url: url)
    }
}
