//
//  DeepLinkRouterTests.swift
//  DeepLinkRouterTests
//
//  Created by Shota Shimazu on 2018/10/21.
//  Copyright © 2018 Shota Shimazu. All rights reserved.
//

import XCTest
import Foundation
@testable import DeepLinkRouter


class DeepLinkRouterTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testRouter() {
        
        let testURLInstance = URL(string: "your-app://next/movie")!
        
        let router = Router(from: testURLInstance)
                
        router.host("next",
            Path("movie", {
                NSLog("LOG: Movie action detected.")
            }),
            Path("photo", {
                NSLog("LOG: Photo action detected.")
            })
        )
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
