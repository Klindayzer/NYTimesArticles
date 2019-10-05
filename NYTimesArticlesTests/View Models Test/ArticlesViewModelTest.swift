//
//  ArticlesViewModelTest.swift
//  NYTimesArticlesTests
//
//  Created by Adham Alkhateeb on 10/6/19.
//  Copyright © 2019 Adham Alkhateeb. All rights reserved.
//

import XCTest
@testable import NYTimesArticles

class ArticlesViewModelTest: XCTestCase {

    func testfetchArticles() {
        
        let mockNetworkAdapter = MockResponseNetworkAdaptor<ArticleModel>(fileName: "mock_most_popular_articles")
        let viewModel = ArticlesViewModel(networkAdaptor: mockNetworkAdapter)
        viewModel.fetchArticles(page: .one) { error in
            XCTAssertTrue(viewModel.articles.value.count == 1)
        }
    }
}
