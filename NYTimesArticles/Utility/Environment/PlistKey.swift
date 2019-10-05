/*
 *	PlistKey.swift
 *	NYTimesArticles
 *
 *	Created by Adham Alkhateeb on 10/5/19.
 *	Copyright 2019 Adham Alkhateeb. All rights reserved.
 */

protocol Plistable {
    var value: String { get }
}

enum PlistKey {
    
    enum URL: Plistable {
        
        case base
        
        var value: String {
            switch  self {
            case .base: return "baseUrl"
            }
        }
    }
    
    enum Tokens: Plistable {
        
        case mostPopular
        
        var value: String {
            switch  self {
            case .mostPopular: return "mostPopularToken"
            }
        }
    }
}
