/*
 *	ArticlesViewModel.swift
 *	NYTimesArticles
 *
 *	Created by Adham Alkhateeb on 10/5/19.
 *	Copyright 2019 Adham Alkhateeb. All rights reserved.
 */

struct ArticlesViewModel {
    
    // MARK: - Protected Properties
    fileprivate let networkAdaptor: NetworkAdaptor
    
    
    // MARK: - Properties
    var articles = Observable([Article]())
    
    
    // MARK: - Constructors
    init(networkAdaptor: NetworkAdaptor = NetworkManager()) {
        self.networkAdaptor = networkAdaptor
    }
    
    
    // MARK: - Protected Methods
    fileprivate func parseResponse(model: ArticleModel, completion: @escaping ApiCallback) {
        
        guard model.errors == nil, let articles = model.articles else {
            completion(model.errors?.first)
            return
        }
        
        self.articles.value = articles
        completion(nil)
    }
    
    
    // MARK: - Exposed Methods
    func fetchArticles(page: Page, completion: @escaping ApiCallback) {
        
        let service = MostPopularArticlesService(page: page)
        networkAdaptor.process(service, type: ArticleModel.self) { result in
            
            switch result {
            case .success(let model):
                self.parseResponse(model: model, completion: completion)
            case .failure(let errorModel):
                completion(errorModel.error)
            }
        }
    }
    
    func article(at index: Int) -> Article? {        
        return articles.value[safe: index]
    }
}
