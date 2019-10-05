/*
 *	MostPopularArticlesService.swift
 *	NYTimesArticles
 *
 *	Created by Adham Alkhateeb on 10/5/19.
 *	Copyright 2019 Adham Alkhateeb. All rights reserved.
 */

import UIKit

enum Page: String {
    
    case one = "1"
    case seven = "7"
    case thirty = "30"
    
    var value: String {
        return "\(rawValue).json"
    }
}

struct MostPopularArticlesService: Buildable {

    let page: Page
    let environment: Environment
    
    init(page: Page, environment: Environment = Environment.shared) {
        self.page = page
        self.environment = environment
    }
    
    var baseUrl: String? {
        return environment.configuration(PlistKey.URL.base) as? String
    }
    
    var endPoint: String {
        return ["svc", "mostpopular", "v2", "viewed", page.value].joined(separator: "/")
    }
    
    var params: Params? {
        return ["api-key": environment.configuration(PlistKey.Tokens.mostPopular) as? String ?? ""]
    }
    
    var url: URL? {
        
        guard let baseUrl = self.baseUrl else { return nil }
        let urlString = [baseUrl, endPoint].joined(separator: "/")
        return URL(string: urlString)
    }
}
