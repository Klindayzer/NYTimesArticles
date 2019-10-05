/*
 *	ArticleModel.swift
 *	NYTimesArticles
 *
 *	Created by Adham Alkhateeb on 10/5/19.
 *	Copyright 2019 Adham Alkhateeb. All rights reserved.
 */

import UIKit

// MARK: - ArticleModel
struct ArticleModel: NYResultable {
    
    let status: String?
    let copyright: String?
    let numResults: Int
    let errors: [String]?
    let articles: [Article]?
    
    enum CodingKeys: String, CodingKey {
        
        case status, copyright, errors
        case numResults = "num_results"
        case articles = "results"
    }
}

// MARK: - Result
struct Article: Codable {

    let id: Int
    let assetID: Int
    let views: Int
    let url: String?
    let adxKeywords: String?
    let column: String?
    let section: String?
    let byline: String?
    let type: String?
    let title: String?
    let abstract: String?
    let publishedDate: String?
    let source: String?
    let perFacet: QuantumValue?
    let desFacet: QuantumValue?
    let orgFacet: QuantumValue?
    let geoFacet: QuantumValue?
    let uri: String?
    let media: [Media]?
    
    enum CodingKeys: String, CodingKey {
        
        case url, column, section, byline, type, title, abstract, source, id, views, uri, media
        case adxKeywords = "adx_keywords"
        case publishedDate = "published_date"
        case assetID = "asset_id"
        case desFacet = "des_facet"
        case orgFacet = "org_facet"
        case perFacet = "per_facet"
        case geoFacet = "geo_facet"
    }
}

// MARK: - Media
struct Media: Codable {
    
    let type: String?
    let subtype: String?
    let caption: String?
    let copyright: String?
    let approvedForSyndication: Int
    let mediaMetadata: [MediaMetadata]?
    
    enum CodingKeys: String, CodingKey {
        
        case type, subtype, caption, copyright
        case approvedForSyndication = "approved_for_syndication"
        case mediaMetadata = "media-metadata"
    }
}

// MARK: - MediaMetadata
struct MediaMetadata: Codable {
    
    let url: String?
    let format: Format?
    let height, width: Int
}

enum Format: String, Codable {
    
    case mediumThreeByTwo210 = "mediumThreeByTwo210"
    case mediumThreeByTwo440 = "mediumThreeByTwo440"
    case standardThumbnail = "Standard Thumbnail"
}

enum QuantumValue: Codable {
    
    func encode(to encoder: Encoder) throws {
        return
    }
    
    case string(String), array([String])
    
    init(from decoder: Decoder) throws {
        
        if let array = try? decoder.singleValueContainer().decode([String].self) {
            self = .array(array)
            return
        }
        
        if let string = try? decoder.singleValueContainer().decode(String.self) {
            self = .string(string)
            return
        }
        
        throw QuantumError.missingValue
    }
    
    enum QuantumError: Error {
        case missingValue
    }
}
