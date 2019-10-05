/*
 *	ArticleDetailsViewController.swift
 *	NYTimesArticles
 *
 *	Created by Adham Alkhateeb on 10/6/19.
 *	Copyright 2019 Adham Alkhateeb. All rights reserved.
 */

import UIKit

class ArticleDetailsViewController: BaseController {
    
    // MARK: - IBOutlet
    @IBOutlet fileprivate weak var articleImageView: UIImageView!
    @IBOutlet fileprivate weak var articleTitleLabel: UILabel!
    @IBOutlet fileprivate weak var articleByLineLabel: UILabel!
    @IBOutlet fileprivate weak var articleDateLabel: UILabel!
    @IBOutlet fileprivate weak var articleDetailsLabel: UILabel!
    
    
    // MARK: - Properties
    fileprivate var article: Article?
    
    
    // MARK: - Overridden Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupArticleInfo(with: article)
    }
    
    // MARK: - Exposed Methods
    func configure(with article: Article?) {
        self.article = article
    }
    
    // MARK: - Protected Methods
    fileprivate func setupArticleInfo(with: Article?) {
        
        guard let article = article else { return }
        articleImageView.setImage(with: article.largImage)
        articleTitleLabel.text = article.title
        articleByLineLabel.text = article.byline
        articleDateLabel.text = article.publishedDate
        articleDetailsLabel.text = article.abstract
    }
}
