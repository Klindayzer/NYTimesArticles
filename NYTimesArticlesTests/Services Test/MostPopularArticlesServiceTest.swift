//
//  MostPopularArticlesServiceTest.swift
//  NYTimesArticlesTests
//
//  Created by Adham Alkhateeb on 10/5/19.
//  Copyright © 2019 Adham Alkhateeb. All rights reserved.
//

import XCTest
@testable import NYTimesArticles

class MostPopularArticlesServiceTest: XCTestCase {

    func testMostPopularArticlesService() {
        
        let environment = Environment(isDebug: true)
        
        // Verify Page number
        var service = MostPopularArticlesService(page: .one, environment: environment)
        var urlString = service.url!.absoluteString
        XCTAssert(urlString.contains("1.json"), "Incorrect page path Format.")
        
        service = MostPopularArticlesService(page: .seven, environment: environment)
        urlString = service.url!.absoluteString
        XCTAssert(urlString.contains("7.json"), "Incorrect page path Format.")
        
        service = MostPopularArticlesService(page: .thirty, environment: environment)
        urlString = service.url!.absoluteString
        XCTAssert(urlString.contains("30.json"), "Incorrect page path Format.")
        
        // Verify base url
        XCTAssertEqual(service.baseUrl, environment.configuration(PlistKey.URL.base) as? String)
        
        // Verify endpoint
        XCTAssert(service.endPoint.contains("svc/mostpopular/v2/viewed"), "Incorrect endpoint path Format.")
        
        // Verify Params
        let expectedParamsKey = "api-key"
        let expectedApiKey = "FQiRAyblED3gWDniasNBguaGGNZek8Z0"
        XCTAssertEqual(service.params?.count, 1)
        XCTAssertNotNil(service.params?[expectedParamsKey])
        XCTAssertEqual(service.params?[expectedParamsKey] as? String, expectedApiKey)
    }
}
