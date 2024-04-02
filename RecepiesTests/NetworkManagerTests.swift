// NetworkManagerTests.swift
// Copyright © RoadMap. All rights reserved.

@testable import Recepies
import XCTest

private protocol MockURLRequestProvider {
    var mockCategoryURLRequest: URLRequest? { get set }
    var mockRecipeURLRequest: URLRequest? { get set }
}

private typealias MockRequestCreatorProtocol = MockURLRequestProvider & RequestCreatorProtocol

private class MockRequestCreator: MockRequestCreatorProtocol {
    var mockCategoryURLRequest: URLRequest?
    var mockRecipeURLRequest: URLRequest?

    func createCategoryURLRequest(type: Recepies.CategoryType, text: String) -> URLRequest? {
        mockCategoryURLRequest
    }

    func createRecipeURLRequest(uri: String) -> URLRequest? {
        mockRecipeURLRequest
    }
}

final class NetworkManagerTests: XCTestCase {
    // MARK: - Private Properties

    private let expectation = XCTestExpectation()
    fileprivate var requestCreator: MockRequestCreatorProtocol?
    fileprivate var networkService: NetworkService?

    // MARK: - Test Methods

    override func setUpWithError() throws {
        requestCreator = MockRequestCreator()
        networkService = NetworkService(requestCreator: requestCreator)
    }

    override func tearDownWithError() throws {
        requestCreator = nil
        networkService = nil
    }

    func testGetRecipesInvalidURL() throws {
        // Given
        let invalidURL = URL(string: "https://www.google.com/")
        guard let invalidURL else { return }
        requestCreator?.mockCategoryURLRequest = URLRequest(url: invalidURL)
        // When
        var recipes: [Recipe]?
        networkService?.getRecipes(type: .chicken, text: "", completion: { result in
            switch result {
            case let .success(success):
                recipes = success
            case .failure:
                break
            }
            self.expectation.fulfill()
        })
        wait(for: [expectation], timeout: 10.0)
        // Then
        XCTAssertNil(recipes)
    }

    func testпetDetailedRecipeInvalidURL() throws {
        // Given
        let invalidURL = URL(string: "https://www.google.com/")
        guard let invalidURL else { return }
        requestCreator?.mockRecipeURLRequest = URLRequest(url: invalidURL)
        // When
        var recipe: RecipeDetail?
        networkService?.getDetailedRecipe(url: "") { result in
            switch result {
            case let .success(success):
                recipe = success
            case .failure:
                break
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
        // Then
        XCTAssertNil(recipe)
    }

    func testPerformanceExample() throws {
        //        measure {}
    }
}

// NetworkService
// func getRecipes(type: CategoryType, text: String, completion: @escaping (Result<[Recipe], Error>) -> ())
// func getDetailedRecipe(url: String, completion: @escaping (Result<RecipeDetail, Error>) -> ())

// RequestCreator
// func createCategoryURLRequest(type: CategoryType, text: String) -> URLRequest?
// func createRecipeURLRequest(uri: String) -> URLRequest?
