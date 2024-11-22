//
//  DeepLinkRouterTests.swift
//  DeepLinkRouterTests
//
//  Created by Shota Shimazu on 2018/10/21.
//  Copyright © 2018 Shota Shimazu. All rights reserved.
//

@testable import DeepLinkRouter
import XCTest

class DeepLinkRouterTests: XCTestCase {
    // MARK: - Properties
    
    private var sut: Router!  // System Under Test
    private var handlerCalled: Bool!
    
    // MARK: - Test Lifecycle
    
    override func setUp() {
        super.setUp()
        handlerCalled = false
    }
    
    override func tearDown() {
        sut = nil
        handlerCalled = nil
        super.tearDown()
    }
    
    // MARK: - Helper Methods
    
    private func createRouter(with urlString: String) throws -> Router {
        guard let url = URL(string: urlString) else {
            throw RouterError.invalidHost
        }
        return try Router(from: url)
    }
    
    private func createTestHandler() -> () -> Void {
        return { [weak self] in
            self?.handlerCalled = true
        }
    }
    
    // MARK: - Initialization Tests
    
    func testRouterInitialization() throws {
        // Given
        let validURLString = "your-app://host/path"
        
        // When
        sut = try createRouter(with: validURLString)
        
        // Then
        XCTAssertNotNil(sut)
    }
    
    func testRouterInitializationWithInvalidURL() {
        // Given
        let invalidURLString = "invalid-url"
        
        // When/Then
        XCTAssertThrowsError(try createRouter(with: invalidURLString)) { error in
            XCTAssertTrue(error is RouterError)
            XCTAssertEqual(error as? RouterError, .invalidHost)
        }
    }
    
    // MARK: - Registration Tests
    
    func testRouteRegistration() throws {
        // Given
        sut = try createRouter(with: "your-app://host/path")
        let testPath = "host/path"
        
        // When
        sut.register(path: testPath, handler: createTestHandler())
        
        // Then
        XCTAssertTrue(sut.hasRoute(for: testPath))
    }
    
    func testMultipleRouteRegistration() throws {
        // Given
        sut = try createRouter(with: "your-app://host/path")
        let routes = [
            "host/movie": createTestHandler(),
            "host/photo": createTestHandler(),
            "host/music": createTestHandler()
        ]
        
        // When
        sut.registerMultiple(routes)
        
        // Then
        routes.keys.forEach { path in
            XCTAssertTrue(sut.hasRoute(for: path))
        }
    }
    
    // MARK: - Routing Tests
    
    func testSuccessfulRouting() throws {
        // Given
        let testPath = "host/movie"
        sut = try createRouter(with: "your-app://\(testPath)")
        sut.register(path: testPath, handler: createTestHandler())
        
        // When
        try sut.perform()
        
        // Then
        XCTAssertTrue(handlerCalled)
    }
    
    func testRouteNotFound() throws {
        // Given
        sut = try createRouter(with: "your-app://host/nonexistent")
        
        // When/Then
        XCTAssertThrowsError(try sut.perform()) { error in
            XCTAssertEqual(error as? RouterError, .routeNotFound)
        }
    }
    
    // MARK: - Query Parameter Tests
    
    func testQueryParameters() throws {
        // Given
        let urlString = "your-app://host/path?key1=value1&key2=value2"
        sut = try createRouter(with: urlString)
        
        // When/Then
        XCTAssertEqual(sut.queryValue(for: "key1"), "value1")
        XCTAssertEqual(sut.queryValue(for: "key2"), "value2")
        XCTAssertNil(sut.queryValue(for: "nonexistent"))
    }
    
    // MARK: - Performance Tests
    
    func testRoutingPerformance() throws {
        // Given
        sut = try createRouter(with: "your-app://host/path")
        let routes = (0..<1000).map { "host/path\($0)" }
        routes.forEach { path in
            sut.register(path: path, handler: {})
        }
        
        // When/Then
        measure {
            _ = try? sut.perform()
        }
    }
    
    func testRouteRegistrationPerformance() throws {
        // Given
        sut = try createRouter(with: "your-app://host/path")
        
        // When/Then
        measure {
            (0..<1000).forEach { index in
                sut.register(path: "host/path\(index)") {}
            }
        }
    }
}
