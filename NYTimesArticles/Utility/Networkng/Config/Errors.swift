/*
 *	Errors.swift
 *	NYTimesArticles
 *
 *	Created by Adham Alkhateeb on 10/3/19.
 *	Copyright 2019 Adham Alkhateeb. All rights reserved.
 */


fileprivate extension String {
    static let invalidURL = "URL is not valid"
    static let unableToDecode = "We could not decode the response."
    static let dataUnavailable = "Response returned with no data to decode."
}

enum NetworkError: Error {
    case noData
    case unableToDecode
    
    var value: String {
        switch self {
        case .noData: return .dataUnavailable
        case .unableToDecode: return .unableToDecode
        }
    }
}

enum URLError: Error {
    case urlMalformatted
    
    var value: String {
        switch self {
        case .urlMalformatted: return .invalidURL
        }
    }
}

enum URLRequestError: Error {
    case encodingFailed
    
    var value: String {
        switch self {
        case .encodingFailed: return .unableToDecode
        }
    }
}
