/*
 *	PostRequestBuilderTests.swift
 *	NYTimesArticles
 *
 *	Created by Adham Alkhateeb on 10/3/19.
 *	Copyright 2019 Adham Alkhateeb. All rights reserved.
 */

import XCTest

import XCTest
@testable import NYTimesArticles

fileprivate struct PostRequestBuilder: Buildable {
    
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
        return .json
    }
    
    var method: HTTPMethodType {
        return .post
    }
    
    var httpTimeout: HTTPTimeout {
        return .fifteen
    }
}

class PostRequestBuilderTests: XCTestCase {
    
    var postRequest: Buildable!
    
    override func setUp() {
        postRequest = PostRequestBuilder()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        postRequest = nil
    }
    
    func testPostRequest() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let request = try? postRequest.asURLRequest()
        XCTAssertEqual(request?.httpMethod, "POST")
        XCTAssertEqual(request?.url?.absoluteString, "http://www.google.com")
        XCTAssertEqual(request?.timeoutInterval, TimeInterval(15.0))
        XCTAssertNotNil(request?.allHTTPHeaderFields)
        XCTAssertEqual(request?.allHTTPHeaderFields?.count, postRequest.headers.count + 1)
    }
}
