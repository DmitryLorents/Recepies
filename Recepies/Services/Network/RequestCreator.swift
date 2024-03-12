// RequestCreator.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Protocol for URL request creation
protocol RequestCreatorProtocol {
    /// Provide URL request for getting recipes by category and search text
    /// - Parameters:
    /// type: type of desired category
    /// text: text from search bar entered by user
    /// - Returns: URL request with necessary parameters
    func createCategoryURLRequest(type: CategoryType, text: String) -> URLRequest?
}

/// Creates URLRequests for NetworkServiceProtocol
final class RequestCreator {
    
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
    
    private func makeQueryItems(type: CategoryType, text: String) -> [URLQueryItem] {
        let typeQuery = URLQueryItem(name: "type", value: "public")
        let appKeyQuery = URLQueryItem(name: "app_key", value: "7e02a24790f9c127571b1a3bad7028d5")
        let imageSizeQuery = URLQueryItem(name: "imageSize", value: "THUMBNAIL")
        let isRandomQuery = URLQueryItem(name: "random", value: "true")
        let dishTypeQuery = URLQueryItem(name: "dishType", value: type.description)
        let searchQuery = makeSearchQuery(type, text: text)
        let uriQuery = URLQueryItem(name: "field", value: "uri")
        let labelQuery = URLQueryItem(name: "field", value: "label")
        let imageQuery = URLQueryItem(name: "field", value: "image")
        let totalTimeQuery = URLQueryItem(name: "field", value: "totalTime")
        let caloriesQuery = URLQueryItem(name: "field", value: "calories")
        var queries: [URLQueryItem] = [typeQuery, appKeyQuery, imageSizeQuery, isRandomQuery, dishTypeQuery, searchQuery, uriQuery, labelQuery, imageQuery, totalTimeQuery, caloriesQuery]
        if type == .sideDish {
            let healthQuery = URLQueryItem(name: "health", value: "vegetarian")
            queries.append(healthQuery)
        }
        return queries
    }
}

// MARK: - RequestCreator - RequestCreatorProtocol
extension RequestCreator: RequestCreatorProtocol {
    func createCategoryURLRequest(type: CategoryType, text: String) -> URLRequest? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.edamam.com/api/recipes/v2"
        components.queryItems = makeQueryItems(type: type, text: text)
        guard let url = components.url else {return nil}
        print("URL:", url)
        return URLRequest(url: url)
    }
}
