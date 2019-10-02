/*
 *	GetRequestBuilderTests.swift
 *	NYTimesArticles
 *
 *	Created by Adham Alkhateeb on 10/3/19.
 *	Copyright 2019 Adham Alkhateeb. All rights reserved.
 */


import XCTest
@testable import NYTimesArticles

fileprivate struct GetRequestBuilder: Buildable {
    
    var url: URL? {
        return URL(string: "http://www.google.com")
    }
    
    var headers: Headers {
        return ["header 1" : "value 1",
                "header 2" : "value 2"]
    }
    
    var params: Params? {
        return ["param 1" : "value 1",
                "param 2" : "value 2"]
    }
    
    var encoding: Encoding {
        return .url
    }
    
    var method: HTTPMethodType {
        return .get
    }
    
    var httpTimeout: HTTPTimeout {
        return .fifteen
    }
}

class GetRequestBuilderTests: XCTestCase {
    
    var getRequest: Buildable!
    
    override func setUp() {
        getRequest = GetRequestBuilder()
    }
    
    override func tearDown() {
        getRequest = nil
    }
    
    func testGetRequest() {
        
        let request = try? getRequest.asURLRequest()
        XCTAssertEqual(request?.httpMethod, "GET")
        XCTAssertEqual(request?.url?.absoluteString, "http://www.google.com?param%201=value%201&param%202=value%202")
        XCTAssertEqual(request?.timeoutInterval, TimeInterval(15.0))
        XCTAssertNotNil(request?.allHTTPHeaderFields)
        XCTAssertEqual(request?.allHTTPHeaderFields?.count, getRequest.headers.count)
    }
}
