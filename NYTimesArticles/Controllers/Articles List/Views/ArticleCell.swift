/*
 *	ArticleCell.swift
 *	NYTimesArticles
 *
 *	Created by Adham Alkhateeb on 10/6/19.
 *	Copyright 2019 Adham Alkhateeb. All rights reserved.
 */

import UIKit

class ArticleCell: UITableViewCell {
    
    // MARK: - IBOutlet
    @IBOutlet fileprivate weak var articleImageView: UIImageView!
    @IBOutlet fileprivate weak var articleTitleLabel: UILabel!
    @IBOutlet fileprivate weak var articleDetailsLabel: UILabel!
    @IBOutlet fileprivate weak var articleSourceLabel: UILabel!
    @IBOutlet fileprivate weak var articleDateLabel: UILabel!
    
    
    // MARK: - Properties
    var article: Article?
    
    
    // MARK: - Overridden Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        articleTitleLabel.text = "Title"
        articleDetailsLabel.text = "Details"
        articleSourceLabel.text = "Source"
        articleDateLabel.text = "Date"
    }
    
    
    // MARK: - Exposed Methods
    func setupCell(with article: Article) {
        
        articleImageView.setImage(with: article.thumbnail)
        articleTitleLabel.text = article.title
        articleDetailsLabel.text = article.byline
        articleSourceLabel.text = article.source
        articleDateLabel.text = article.publishedDate
    }
    
    
    // MARK: - Protected Methods
    fileprivate func setupUI() {
        
        articleImageView.layer.borderWidth = 1
        articleImageView.layer.borderColor = UIColor.lightGray.cgColor
        articleImageView.layer.cornerRadius = 30
        articleImageView.layer.masksToBounds = true
    }
    
}
