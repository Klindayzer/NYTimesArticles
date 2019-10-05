/*
 *	NetworkManager.swift
 *	NYTimesArticles
 *
 *	Created by Adham Alkhateeb on 10/5/19.
 *	Copyright 2019 Adham Alkhateeb. All rights reserved.
 */

import Foundation

enum Keys: String, Localizable {
    case noInternetError = "no_internet_alert_title"
    case noInternetAlertMessage = "no_internet_alert_message"
}

protocol NetworkAdaptor {
    func process<T: Resultable>(_ buildable: Buildable, type: T.Type, completion: @escaping (ServiceResult<T>) -> Void)
}

struct NetworkManager: NetworkAdaptor {
    
    // MARK: - Properties
    let engine: NetworkEngine
    
    
    // MARK: - Constructors
    init(type: SessionManagerType = .default) {
        engine = NetworkEngine(manager: type.sessionManager, enableLog: isDebug)
    }
    
    
    // MARK: - Exposed Methods
    func process<T: Resultable>(_ buildable: Buildable, type: T.Type, completion: @escaping (ServiceResult<T>) -> Void) {
        
        guard isNetworkReachable.value else {
            
            completion(.failure(ServiceError(error: Keys.noInternetError.value, statusCode: 0)))
            return
        }
        
        DispatchQueue.global(qos: .background).async {
            self.fetch(buildable, type: type, completion: completion)
        }
    }
    
    
    // MARK: - Protected Methods
    fileprivate func fetch<T: Resultable>(_ buildable: Buildable, type: T.Type, completion: @escaping (ServiceResult<T>) -> Void) {
        
        engine.request(buildable, type: T.self) { (result) in
            self.handle(result, completion: completion)
        }
    }
    
    fileprivate func handle<T: Resultable>(_ result: ServiceResult<T>, completion: @escaping (ServiceResult<T>) -> Void) {
        DispatchQueue.main.async {
            completion(result)
        }
    }
}
