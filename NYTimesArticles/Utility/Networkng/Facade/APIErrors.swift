/*
 *	APIErrors.swift
 *	NYTimesArticles
 *
 *	Created by Adham Alkhateeb on 10/5/19.
 *	Copyright 2019 Adham Alkhateeb. All rights reserved.
 */

typealias ApiCallback = (String?) -> Void

// MARK: - APIError
struct APIErrors: Codable {
    let fault: Fault?
}

// MARK: - Fault
struct Fault: Codable {
    let faultstring: String?
    let detail: Detail?
}

// MARK: - Detail
struct Detail: Codable {
    let errorcode: String?
}
