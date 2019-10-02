/*
 *	SessionManagerType.swift
 *	NYTimesArticles
 *
 *	Created by Adham Alkhateeb on 10/3/19.
 *	Copyright 2019 Adham Alkhateeb. All rights reserved.
 */

import Alamofire

enum SessionManagerType {

    case `default`
    case ephemeral
    
    var sessionManager: SessionManager {
        return Alamofire.SessionManager(configuration: configuration)
    }
    
    fileprivate var configuration: URLSessionConfiguration {
        var configuration = URLSessionConfiguration.ephemeral
        if self == .default {
            configuration = URLSessionConfiguration.default
            configuration.urlCache = nil
        }
        return configuration
    }
}
