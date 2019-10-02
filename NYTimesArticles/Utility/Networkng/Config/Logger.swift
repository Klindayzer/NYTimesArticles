/*
 *	Logger.swift
 *	NYTimesArticles
 *
 *	Created by Adham Alkhateeb on 10/2/19.
 *	Copyright 2019 Adham Alkhateeb. All rights reserved.
 */

import Foundation

protocol Logger {
    var shouldLog: Bool { get }
}

extension Logger {
    
    // MARK: - Log Request
    func log(_ request: URLRequest?) {
        
        guard shouldLog else { return }
        
        print("\n - - - - - - - - - - REQUEST STARTS - - - - - - - - - - \n")
        defer { print("\n - - - - - - - - - - REQUEST ENDS - - - - - - - - - - \n") }
        
        guard let request = request else {
            print("\n - - - - - - - - - - NIL - - - - - - - - - - \n")
            return
        }
        
        if let urlAsString = request.url?.absoluteURL {
            print("URL: \(urlAsString)")
        }
        
        if let method = request.httpMethod {
            print("\nMethod: \(method)")
        }
        
        if let headerParams = request.allHTTPHeaderFields {
            print("\nHeader Params: ")
            print(headerParams)
        }
        
        if let body = request.httpBody {
            do {
                if let postParams = try JSONSerialization.jsonObject(with: body, options: .mutableContainers) as? [String: Any] {
                    print("\nPost Params: ")
                    print(postParams)
                }
            } catch let e {
                print("\nException: \(e.localizedDescription)")
            }
        }
    }
    
    // MARK: - Log Response
    func log(_ response: HTTPURLResponse?, data: Data?) {
        
        guard shouldLog else { return }
        
        print("\n - - - - - - - - - - REPONSE STARTS - - - - - - - - - - \n")
        defer { print("\n - - - - - - - - - - REPONSE ENDS - - - - - - - - - - \n") }
        print("Status Code: \(response?.statusCode ?? 0)")
        
        guard let data = data,
            let JSONString = String(data: data, encoding: String.Encoding.utf8),
            !JSONString.isEmpty else {
                print("Response: Empty")
                return
        }
        
        print("\nResponse: \n\(JSONString)")
    }
    
    // MARK: - Log Error
    func log<T>(error: T) {
        
        guard shouldLog else { return }
        
        print("\n - - - - - - - - - - EXCEPTION STARTS - - - - - - - - - - \n")
        defer { print("\n - - - - - - - - - - EXCEPTION ENDS - - - - - - - - - - \n") }
        print("Error: \(error)")
    }
}
