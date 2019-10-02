/*
 *	Buildable.swift
 *	NYTimesArticles
 *
 *	Created by Adham Alkhateeb on 10/3/19.
 *	Copyright 2019 Adham Alkhateeb. All rights reserved.
 */

import Foundation
import Alamofire


// MARK: - Type
typealias Params = [String: Any]
typealias Headers = [String: String]


// MARK: - Definitions
enum Encoding {
    case json
    case url
    case formURL
}

enum HTTPMethodType: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

enum HTTPTimeout: Int {
    case fifteen = 15
    case thirty = 30
    case sixty = 60
    case ninty = 90
}

protocol Buildable {
    
    // MARK: - Properties
    var url: URL? { get }
    var headers: Headers { get }
    var params: Params? { get }
    var encoding: Encoding { get }
    var method: HTTPMethodType { get }
    var httpTimeout: HTTPTimeout { get }
}

extension Buildable {
    
    // MARK: - Protected Properties
    fileprivate var httpMethod: HTTPMethodType {
        return method
    }
    
    fileprivate var timeoutInterval: TimeInterval {
        return TimeInterval(httpTimeout.rawValue)
    }
    
    fileprivate var parameterEncoding: ParameterEncoding {
        
        switch encoding {
        case .json:
            return JSONEncoding.default
        case .url:
            return URLEncoding.default
        case .formURL:
            return URLEncoding.httpBody
        }
    }
    
    
    // MARK: - Exposed Methods
    func asURLRequest() throws -> URLRequest {
        
        guard let formedURL = url else {
            throw URLError.urlMalformatted
        }
        
        var request = URLRequest(url: formedURL)
        request.httpMethod = httpMethod.rawValue
        request.allHTTPHeaderFields = headers
        request.timeoutInterval = timeoutInterval
        do {
            return try parameterEncoding.encode(request, with: params)
        } catch {
            throw URLRequestError.encodingFailed
        }
    }
}
