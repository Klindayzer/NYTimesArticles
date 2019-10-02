/*
 *	Engine.swift
 *	NYTimesArticles
 *
 *	Created by Adham Alkhateeb on 10/2/19.
 *	Copyright 2019 Adham Alkhateeb. All rights reserved.
 */


import Alamofire

public struct NetworkEngine: Logger, Fetchable {
    
    // MARK: - Properties
    fileprivate let manager: SessionManager
    fileprivate let enableLog: Bool
    
    // MARK: - Overridden Properties
    var shouldLog: Bool {
        return enableLog
    }
    
    
    // MARK: - Constructors
    init(manager: SessionManager, enableLog: Bool) {
        
        self.manager = manager
        self.enableLog = enableLog
    }
    
    
    // MARK: - Exposed Methods
    func request<T: Resultable>(_ buildable: Buildable, type: T.Type, completion: @escaping (ServiceResult<T>) -> Void) {
       
        do {
            let request = try buildable.asURLRequest()
            fetch(request, completion: completion)            
        } catch let exception {
            self.log(error: exception)
            completion(.failure(ServiceError(error: exception.localizedDescription)))
        }
    }
    
    func invalidateAndCancelTasks() {
        manager.session.invalidateAndCancel()
    }
    
    func finishTasksAndInvalidate() {
        manager.session.finishTasksAndInvalidate()
    }
    
    
    // MARK: - Protected Methods
    fileprivate func fetch<T: Resultable>(_ request: URLRequest, completion: @escaping (ServiceResult<T>) -> Void) {
        
        let dataRequest = manager.request(request).validate()
        fetch(dataRequest) { (data, response, error) in
            self.log(request)
            self.log(response, data: data)
            
            guard let responseData = data, response != nil else {
                completion(.failure(ServiceError(error: NetworkError.noData.value)))
                return
            }
            
            completion(T.result(responseData: responseData, response: response))
        }
    }
}
