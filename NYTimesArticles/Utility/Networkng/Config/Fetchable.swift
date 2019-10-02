/*
 *	Fetchable.swift
 *	NYTimesArticles
 *
 *	Created by Adham Alkhateeb on 10/2/19.
 *	Copyright 2019 Adham Alkhateeb. All rights reserved.
 */

import Alamofire

// MARK: - Type
typealias NetworkCompletion = (_ data: Data?, _ response: HTTPURLResponse?, _ error: Error?) -> Void

protocol Fetchable {
    func fetch(_ dataRequest: DataRequest, completion: @escaping NetworkCompletion)
}

extension Fetchable {
    
    func fetch(_ dataRequest: DataRequest, completion: @escaping NetworkCompletion) {
        dataRequest.responseString { responseString in
            completion(responseString.data, responseString.response, responseString.error)
        }
    }
}
