/*
 *	JSONUtility.swift
 *	NYTimesArticles
 *
 *	Created by Adham Alkhateeb on 10/6/19.
 *	Copyright 2019 Adham Alkhateeb. All rights reserved.
 */

import Foundation

enum FileError: Error {
    case notFound
}

enum JsonError: Error {
    case serializationError(error: Error?)
}

class JSONUtility: NSObject {
    
    func readJSONFileFromBundle(name fileName: String) throws -> Data {
        
        guard let path = Bundle(for: type(of: self)).path(forResource: fileName, ofType: "json") else {
            throw FileError.notFound
        }
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            return data
        } catch let error {
            throw JsonError.serializationError(error: error)
        }
    }
}
