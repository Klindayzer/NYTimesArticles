/*
 *	NYResultable.swift
 *	NYTimesArticles
 *
 *	Created by Adham Alkhateeb on 10/5/19.
 *	Copyright 2019 Adham Alkhateeb. All rights reserved.
 */

import UIKit

protocol NYResultable: Resultable {}

extension NYResultable {
    
    func result() -> ServiceResult<Self> {
        return .success(self)
    }
    
    static func result<T: Resultable>(responseData: Data, response: HTTPURLResponse?) -> ServiceResult<T> {
        
        do {
            let systemErrors = try JSONDecoder().decode(APIErrors.self, from: responseData)
            if let faultstring = systemErrors.fault?.faultstring,
                let errorCode = systemErrors.fault?.detail?.errorcode {
                return .failure(ServiceError(error: faultstring, errorCode: errorCode, statusCode: 401))
            } else {
                let object = try JSONDecoder().decode(T.self, from: responseData)
                return object.result()
            }
        } catch let exception {
            return .failure(ServiceError(error: exception.localizedDescription))
        }
    }
}

