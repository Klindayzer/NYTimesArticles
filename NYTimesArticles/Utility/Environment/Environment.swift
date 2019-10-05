/*
 *	Environment.swift
 *	NYTimesArticles
 *
 *	Created by Adham Alkhateeb on 10/5/19.
 *	Copyright 2019 Adham Alkhateeb. All rights reserved.
 */

import Foundation

struct Environment {
    
    // MARK: - Properties
    static let shared = Environment()
    fileprivate let settingDict: [String: Any]?
    
    
    // MARK: - Constructors
    fileprivate init () {
        settingDict = Bundle.parsePlist(ofName: isDebug ? .sandboxSettingsFile : .productionSettingsFile)
    }
    
    // MARK: - Constructors Test
    init (isDebug: Bool) {
        settingDict = Bundle.parsePlist(ofName: isDebug ? .sandboxSettingsFile : .productionSettingsFile)
    }
    
    
    // MARK: - Exposed Methods
    func configuration(_ key: Plistable) -> Any? {
        
        guard let value = settingDict?[key.value] else {
            return nil
        }
        return value
    }
}

fileprivate extension String {
    
    // MARK: - Definitions -
    static let sandboxSettingsFile = "Sandbox"
    static let productionSettingsFile = "PROD"
    static let plistKey = "plist"
    static let fetalErrorForPlistFile = "Environment::Plist File Not Copied in the Build Script phase."
}

fileprivate extension Bundle {
    
    static func parsePlist(ofName name: String) -> [String: AnyObject]? {
        
        // check if plist data available
        guard let plistURL = Bundle.main.url(forResource: name, withExtension: .plistKey),
            let data = try? Data(contentsOf: plistURL)
            else {
                print(String.fetalErrorForPlistFile)
                return nil
        }
        
        // parse plist into [String: Anyobject]
        guard let plistDictionary = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil) as? [String: AnyObject] else {
            return nil
        }
        return plistDictionary
    }
}
