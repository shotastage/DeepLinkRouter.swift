//
//  DeepLinkRouterTests.swift
//  DeepLinkRouterTests
//
//  Created by Shota Shimazu on 2018/10/21.
//  Copyright © 2018 Shota Shimazu. All rights reserved.
//

import XCTest
@testable import DeepLinkRouter

class DeepLinkRouterTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testRouter() {
        
        let testURLInstance = URL(string: "your-app://open.with.launchcode/movie/")!
        
        let router = Router(url: testURLInstance)
        
        router.path("movie", {
            NSLog("Movie is launched.")
        })
        
        router.path("music", {
            NSLog("Music is launched.")
        })
        
        router.path("photo", {
            NSLog("Photo is launched.")
        })
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
