/*
 *	Buildable+Extension.swift
 *	NYTimesArticles
 *
 *	Created by Adham Alkhateeb on 10/5/19.
 *	Copyright 2019 Adham Alkhateeb. All rights reserved.
 */

extension Buildable {

    var encoding: Encoding {
        return .url
    }
    
    var method: HTTPMethodType {
        return .get
    }
    
    var httpTimeout: HTTPTimeout {
        return .ninty
    }
    
    var headers: Headers {
        return [:]
    }
    
    var params: Params? {
        return nil
    }
}
