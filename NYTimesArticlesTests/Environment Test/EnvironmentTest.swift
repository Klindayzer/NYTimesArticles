//
//  EnvironmentTest.swift
//  NYTimesArticlesTests
//
//  Created by Adham Alkhateeb on 10/5/19.
//  Copyright © 2019 Adham Alkhateeb. All rights reserved.
//

import XCTest
@testable import NYTimesArticles

class EnvironmentTest: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
    }

    func testSandboxEnvironment() {
        
        let environment = Environment(isDebug: true)
        let baseUrl = "http://api.nytimes.com"
        let mostPopularToken = "FQiRAyblED3gWDniasNBguaGGNZek8Z0"
        XCTAssertEqual(environment.configuration(PlistKey.URL.base) as? String, baseUrl)
        XCTAssertEqual(environment.configuration(PlistKey.Tokens.mostPopular) as? String, mostPopularToken)
    }
    
    func testProductionEnvironment() {
        
        let environment = Environment(isDebug: false)
        let baseUrl = "http://api.nytimes.com"
        let mostPopularToken = "FQiRAyblED3gWDniasNBguaGGNZek8Z0"
        XCTAssertEqual(environment.configuration(PlistKey.URL.base) as? String, baseUrl)
        XCTAssertEqual(environment.configuration(PlistKey.Tokens.mostPopular) as? String, mostPopularToken)
    }
}
