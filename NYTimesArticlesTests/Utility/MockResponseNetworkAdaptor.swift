/*
 *	MockResponseNetworkAdaptor.swift
 *	NYTimesArticles
 *
 *	Created by Adham Alkhateeb on 10/6/19.
 *	Copyright 2019 Adham Alkhateeb. All rights reserved.
 */

@testable import NYTimesArticles

struct MockResponseNetworkAdaptor<T: Resultable>: NetworkAdaptor {
    
    let fileName: String
    
    func process<T: Resultable>(_ buildable: Buildable, type: T.Type, completion: @escaping (ServiceResult<T>) -> Void) {
        
        guard let data = try? JSONUtility().readJSONFileFromBundle(name: fileName) else {
            completion(.failure(ServiceError(error: .noFile)))
            return
        }
        
        let serviceResult = T.result(responseData: data, response: nil) as ServiceResult<T>
        switch serviceResult {
        case .success(let model):
            return completion(.success(model))
        case .failure(let error):
            completion(.failure(ServiceError(error: error.error, statusCode: error.statusCode)))
        }
    }
}

fileprivate extension String {
    static let noFile = "We could not locate the file."
}
