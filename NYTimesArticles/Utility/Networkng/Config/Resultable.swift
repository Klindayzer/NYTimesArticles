/*
 *	Resultable.swift
 *	NYTimesArticles
 *
 *	Created by Adham Alkhateeb on 10/3/19.
 *	Copyright 2019 Adham Alkhateeb. All rights reserved.
 */

import Foundation

fileprivate extension String {
    static let unknown = "unknown"
}

enum ServiceResult<T: Codable> {
    case success(T)
    case failure(ServiceError)
}

protocol Resultable: Codable {
    func result() -> ServiceResult<Self>
    static func result<T: Resultable>(responseData: Data, response: HTTPURLResponse?) -> ServiceResult<T>
}

struct ServiceError: Error {
    
    let error: String
    let statusCode: Int
    let errorCode: String?
    
    init(error: String?, errorCode: String? = nil, statusCode: Int? = 0) {
       
        self.error = error ?? .unknown
        self.statusCode = statusCode ?? 0
        self.errorCode = errorCode
    }
}
