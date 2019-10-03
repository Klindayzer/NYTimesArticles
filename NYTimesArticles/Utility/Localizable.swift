/*
 *	Localizable.swift
 *	NYTimesArticles
 *
 *	Created by Adham Alkhateeb on 10/3/19.
 *	Copyright 2019 Adham Alkhateeb. All rights reserved.
 */

import Foundation

protocol Localizable: RawRepresentable {
    var value: String { get }
}

extension Localizable where RawValue == String {
    var value: String {
        return rawValue.localized
    }
}

fileprivate extension String {
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
