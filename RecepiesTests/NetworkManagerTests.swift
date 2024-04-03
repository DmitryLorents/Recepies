// NetworkManagerTests.swift
// Copyright © RoadMap. All rights reserved.

@testable import Recepies
import XCTest

private protocol MockURLRequestProvider {
    var mockURLRequest: URLRequest? { get set }
}

private typealias MockRequestCreatorProtocol = MockURLRequestProvider & RequestCreatorProtocol

private class MockRequestCreator: MockRequestCreatorProtocol {
    var mockURLRequest: URLRequest?

    func createCategoryURLRequest(type: Recepies.CategoryType, text: String) -> URLRequest? {
        mockURLRequest
    }

    func createRecipeURLRequest(uri: String) -> URLRequest? {
        mockURLRequest
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
        requestCreator?.mockURLRequest = URLRequest(url: invalidURL)
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
        requestCreator?.mockURLRequest = URLRequest(url: invalidURL)
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

    func testGetRecipesWithJSONstubURL() throws {
        // Given
        let fileName = "recipesStub"
        let jsonStubURL = makeStubURL(fileName: fileName)
        guard let jsonStubURL else {
            return
        }
        requestCreator?.mockURLRequest = URLRequest(url: jsonStubURL)
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
        XCTAssertEqual(recipes?.count, 4)
        XCTAssertEqual(recipes?.first?.name, "Stub")
        XCTAssertEqual(recipes?.first?.uri, "myURI")
        XCTAssertEqual(recipes?.first?.recipeImage, "stubImage")
        XCTAssertEqual(recipes?.first?.calories, 100)
        XCTAssertEqual(recipes?.first?.timeToCook, 100)
    }

    func testGetDetailRecipeWithJSONstubURL() throws {
        // Given
        let fileName = "detailRecipeStub"
        let jsonStubURL = makeStubURL(fileName: fileName)
        guard let jsonStubURL else {
            return
        }
        requestCreator?.mockURLRequest = URLRequest(url: jsonStubURL)
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

        XCTAssertEqual(recipe?.name, "Stub")
        XCTAssertEqual(recipe?.recipeImage, "Stub")
        XCTAssertEqual(recipe?.timeToCook, 100.0)
    }

//    func testPerformanceExample() throws {
//        //        measure {}
//    }

    private func makeStubURL(fileName: String) -> URL? {
        let bundleURL = Bundle.main.url(forResource: fileName, withExtension: "json")
        guard let bundleURL else {
            let errorText = "Absence of mock file: \(fileName).json"
            debugPrint(errorText)
            return nil
        }
        return bundleURL
    }
}
